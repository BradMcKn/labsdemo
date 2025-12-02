# This script detects and restarts AKS deployments with CrashLoopBackOff pods
# Can be called directly or from Azure DevOps Pipeline (inline or file-based)
function Invoke-HandleCrashLoopBackOff {
    param(
        [string]$resourceGroup,

        [string]$clusterName,
        
        [string]$namespace
    )

    # Connect to the AKS cluster
    az aks get-credentials --resource-group $resourceGroup --name $clusterName --overwrite-existing
    kubectl config set-context --current --namespace=$namespace

    # Get all pods in the namespace as JSON
    $pods = kubectl get pods -n $namespace -o json | ConvertFrom-Json

    if (-not $pods -or -not $pods.items) {
        Write-Warning "No pods found in namespace '$namespace' or failed to get pods."
        return
    }

    foreach ($pod in $pods.items) {
        $podName        = $pod.metadata.name
        $foundCrashLoop = $false

        # Guard: status or containerStatuses can be null
        if (-not $pod.status -or -not $pod.status.containerStatuses) {
            continue
        }

        foreach ($containerStatus in $pod.status.containerStatuses) {
            # Guard: state / waiting can be null for running containers
            if ($containerStatus.state -and
                $containerStatus.state.waiting -and
                $containerStatus.state.waiting.reason -eq "CrashLoopBackOff") {

                Write-Host "Pod $podName has a container in CrashLoopBackOff!"
                $foundCrashLoop = $true
                break
            }
        }

        if (-not $foundCrashLoop) {
            continue
        }

        # Try to identify the Deployment (via ReplicaSet OwnerReference)
        $deploymentName = $null
        $ownerRefs      = $pod.metadata.ownerReferences

        if ($ownerRefs) {
            foreach ($owner in $ownerRefs) {
                if ($owner.kind -eq "ReplicaSet") {
                    $replicaSetName = $owner.name

                    $rsJson = kubectl get replicaset $replicaSetName -n $namespace -o json | ConvertFrom-Json
                    if ($rsJson -and $rsJson.metadata -and $rsJson.metadata.ownerReferences) {
                        foreach ($rsOwner in $rsJson.metadata.ownerReferences) {
                            if ($rsOwner.kind -eq "Deployment") {
                                $deploymentName = $rsOwner.name
                                break
                            }
                        }
                    }
                }

                if ($deploymentName) { break }
            }
        }

        if ($deploymentName) {
            Write-Host "Restarting deployment: $deploymentName due to CrashLoopBackOff detected."
            kubectl rollout restart deployment/$deploymentName -n $namespace
        }
        else {
            Write-Host "Could not identify deployment for pod $podName. Manual check required."
        }
    }
}

# Auto-execute if not dot-sourced
if ($MyInvocation.InvocationName -ne '.') {
    Invoke-HandleCrashLoopBackOff -resourceGroup $resourceGroup -clusterName $clusterName -namespace $namespace
}
