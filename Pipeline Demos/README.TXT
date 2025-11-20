the point of this folder is to go over DevOps CI/CD Pipelines with multiple sections (files) covering different aspects.
first that look at what CI/CD is.

CI stands for Continuous Integration and is where we automatically build, test and integrate code every time we commit a change.
Developers can push code to a repo example would be Github. A pipeline will automatically pull the code  build it run test like secrurity scans and unit test and will notify you if something is wrong. 

CD stands for Continuous Delivery after the CI the Pipeline auotmatical prepares the build into deployable packages. 
with Continuous Delivery it can wait for approval from human or manual deployment. This process can be auto deployed but that is perfered to lower environments like DEV/QA and sometimes Stage but Production shouldn't be automated in case something gets pushed when it shouldn't have. 

a good and simpliestic flow to look at CI/CD

Dev code (developers write new code for the application)
Code then gets pushed to a Source Code Managment (SCM) like git, github, bitbucket, and azure repos
ci  builds and compiles the code into package
cd release packages and deployes application to an environment

Tools for CI/CD Pipelines
-Jenkins
-ADO 
-Git Labs CI
-Circle CI
