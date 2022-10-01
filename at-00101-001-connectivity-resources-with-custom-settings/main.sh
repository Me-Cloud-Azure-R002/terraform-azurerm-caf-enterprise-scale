#!/bin/bash

mkdir -p .output/

mydatetimenow=$(date  -u +"%Y-%m-%dT%H:%M:%SZ")
printf "INITIATED:PLAN: $mydatetimenow \n \n \n"

myoutfilename=".output/tfplan-$mydatetimenow.out"
mylogfilename=".output/plan-$mydatetimenow.log"

printf "myoutfilename = $myoutfilename \n \n"
printf "mylogfilename = $mylogfilename \n \n"
terraform plan -out "$myoutfilename" --json | tee -a "$mylogfilename"
# terraform plan -out=".output/tfplan-$mydatetimenow" | tee -a ".output/plan-$mydatetimenow.log"
# terraform plan -out=".output/tfplan-$mydatetimenow" | iconv --to-code=UTF-8 --output=".output/plan-$mydatetimenow.log" --verbose
# terraform plan -out ".output/tfplan-$mydatetimenow".out | iconv --to-code=UTF-8 --output=".output/plan-$mydatetimenow.log" --verbose
printf "COMPLETED:PLAN: $myoutfilename \n \n"

read -p "Do you want to apply? (yes/no)?" doapply
printf "\n \n"
if [ "$doapply" = "yes" ]
then
    printf "INITIATED:APPLY: $myoutfilename \n \n"
    terraform apply | tee -a "$mylogfilename-applied"
    # terraform apply -state "$myoutfilename" | tee -a "$mylogfilename-applied"
    printf "COMPLETED:APPLY: $myoutfilename \n \n"
fi
