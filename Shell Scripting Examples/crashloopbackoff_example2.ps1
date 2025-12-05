# This script checks AKS cluster for pods in CrashLoopBackOff state
# Returns exit code 1 if CrashLoopBackOff pods are found, 0 if none found
# Can be used in Azure DevOps Pipeline for monitoring and alerting

# Script-level parameters for direct execution
param(
    [Parameter(Mandatory=$false)]
    [string]$resourceGroup = "myResourceGroup",
    
    [Parameter(Mandatory=$false)]
    [string]$clusterName = "myAKSCluster",
    
    [Parameter(Mandatory=$false)]
    [string]$namespace = "default",
    
    [Parameter(Mandatory=$false)]
    [switch]$allNamespaces = $false,
    
    [Parameter(Mandatory=$false)]
    [switch]$failOnError = $true
)

function Test-CrashLoopBackOff {
    param(
        [string]$resourceGroup,
        [string]$clusterName,
        [string]$namespace,
        [bool]$allNamespaces,
        [bool]$failOnError
    )

    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "AKS CrashLoopBackOff Detection" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "Resource Group: $resourceGroup"
    Write-Host "Cluster Name: $clusterName"
    
    if ($allNamespaces) {
        Write-Host "Namespace: ALL"
    } else {
        Write-Host "Namespace: $namespace"
    }
    Write-Host ""

    # Connect to the AKS cluster
    Write-Host "Connecting to AKS cluster..." -ForegroundColor Yellow
    az aks get-credentials --resource-group $resourceGroup --name $clusterName --overwrite-existing
    
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to connect to AKS cluster"
        return 1
    }

    # Get all pods based on namespace selection
    Write-Host "Retrieving pod information..." -ForegroundColor Yellow
    
    if ($allNamespaces) {
        $pods = kubectl get pods --all-namespaces -o json | ConvertFrom-Json
    } else {
        kubectl config set-context --current --namespace=$namespace
        $pods = kubectl get pods -n $namespace -o json | ConvertFrom-Json
    }

    if (-not $pods -or -not $pods.items) {
        Write-Warning "No pods found or failed to retrieve pods."
        return 0
    }

    Write-Host "Total pods found: $($pods.items.Count)" -ForegroundColor Green
    Write-Host ""

    # Track CrashLoopBackOff pods
    $crashLoopPods = @()
    
    foreach ($pod in $pods.items) {
        $podName = $pod.metadata.name
        $podNamespace = $pod.metadata.namespace
        
        # Guard: status or containerStatuses can be null
        if (-not $pod.status -or -not $pod.status.containerStatuses) {
            continue
        }

        foreach ($containerStatus in $pod.status.containerStatuses) {
            # Check for CrashLoopBackOff state
            if ($containerStatus.state -and
                $containerStatus.state.waiting -and
                $containerStatus.state.waiting.reason -eq "CrashLoopBackOff") {

                $crashLoopInfo = [PSCustomObject]@{
                    Namespace = $podNamespace
                    PodName = $podName
                    ContainerName = $containerStatus.name
                    RestartCount = $containerStatus.restartCount
                    Reason = $containerStatus.state.waiting.reason
                    Message = $containerStatus.state.waiting.message
                }
                
                $crashLoopPods += $crashLoopInfo
            }
        }
    }

    # Report findings
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "SCAN RESULTS" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    
    if ($crashLoopPods.Count -eq 0) {
        Write-Host "✓ SUCCESS: No CrashLoopBackOff pods detected!" -ForegroundColor Green
        return 0
    } else {
        Write-Host "✗ ALERT: Found $($crashLoopPods.Count) pod(s) in CrashLoopBackOff state!" -ForegroundColor Red
        Write-Host ""
        
        # Display detailed information
        foreach ($pod in $crashLoopPods) {
            Write-Host "----------------------------------------" -ForegroundColor Yellow
            Write-Host "Namespace:       $($pod.Namespace)" -ForegroundColor Yellow
            Write-Host "Pod:             $($pod.PodName)" -ForegroundColor Yellow
            Write-Host "Container:       $($pod.ContainerName)" -ForegroundColor Yellow
            Write-Host "Restart Count:   $($pod.RestartCount)" -ForegroundColor Yellow
            Write-Host "Reason:          $($pod.Reason)" -ForegroundColor Red
            if ($pod.Message) {
                Write-Host "Message:         $($pod.Message)" -ForegroundColor Red
            }
            Write-Host ""
        }
        
        # Get deployment information for each pod
        Write-Host "========================================" -ForegroundColor Cyan
        Write-Host "AFFECTED DEPLOYMENTS" -ForegroundColor Cyan
        Write-Host "========================================" -ForegroundColor Cyan
        
        foreach ($pod in $crashLoopPods) {
            $podJson = kubectl get pod $pod.PodName -n $pod.Namespace -o json | ConvertFrom-Json
            $ownerRefs = $podJson.metadata.ownerReferences
            
            if ($ownerRefs) {
                foreach ($owner in $ownerRefs) {
                    if ($owner.kind -eq "ReplicaSet") {
                        $rsJson = kubectl get replicaset $owner.name -n $pod.Namespace -o json | ConvertFrom-Json
                        if ($rsJson -and $rsJson.metadata -and $rsJson.metadata.ownerReferences) {
                            foreach ($rsOwner in $rsJson.metadata.ownerReferences) {
                                if ($rsOwner.kind -eq "Deployment") {
                                    Write-Host "  → Deployment: $($rsOwner.name) (Namespace: $($pod.Namespace))" -ForegroundColor Cyan
                                }
                            }
                        }
                    }
                }
            }
        }
        
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Cyan
        
        if ($failOnError) {
            Write-Error "Pipeline will fail due to CrashLoopBackOff pods detected."
            return 1
        } else {
            Write-Warning "CrashLoopBackOff pods detected, but continuing (failOnError=$failOnError)"
            return 0
        }
    }
}

# Auto-execute if not dot-sourced
if ($MyInvocation.InvocationName -ne '.') {
    $exitCode = Test-CrashLoopBackOff -resourceGroup $resourceGroup -clusterName $clusterName -namespace $namespace -allNamespaces $allNamespaces -failOnError $failOnError
    exit $exitCode
}
