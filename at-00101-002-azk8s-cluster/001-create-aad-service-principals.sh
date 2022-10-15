#!/bin/bash
# Ref - https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash#create-a-service-principal

clear
export MSYS_NO_PATHCONV=1
mkdir -p .output/
mkdir -p .output/backups/

# Archive the existing output files
mv .output/*.* --target-directory .output/backups/

mydatetimenow=$(date  -u +"%Y-%m-%dT%H:%M:%S")
printf "INITIATED **** SERVICE PRINCIPAL GENERATION : $mydatetimenow \n \n \n"
myspdetailsfilename=".output/spdetails-$mydatetimenow.log"
az ad sp create-for-rbac --name sp-at002-app001-contributor --role Contributor --scopes /subscriptions/e6293692-b3fb-47ac-b4d6-b9f88a0c8bf6  >> "$myspdetailsfilename"
printf "COMPLETED **** SERVICE PRINCIPAL GENERATION : $mydatetimenow \n \n \n"