#!/bin/bash
clear
mkdir -p .output/
mkdir -p .output/backups/

# Archive the existing output files
mv .output/* --target-directory .output/backups/

mydatetimenow=$(date  -u +"%Y-%m-%dT%H:%M:%S")
printf "INITIATED **** PLAN : $mydatetimenow \n \n \n"

myoutfilename=".output/out-$mydatetimenow.tfplan"
mylogfilename=".output/plan-$mydatetimenow.log"

printf "myoutfilename = $myoutfilename \n \n"
printf "mylogfilename = $mylogfilename \n \n"
# terraform plan -out "$myoutfilename" --json | tee -a "$mylogfilename"
terraform plan -out "$myoutfilename" -no-color >> "$mylogfilename"
# terraform plan -out=".output/tfplan-$mydatetimenow" | tee -a ".output/plan-$mydatetimenow.log"
# terraform plan -out=".output/tfplan-$mydatetimenow" | iconv --to-code=UTF-8 --output=".output/plan-$mydatetimenow.log" --verbose
# terraform plan -out ".output/tfplan-$mydatetimenow".out | iconv --to-code=UTF-8 --output=".output/plan-$mydatetimenow.log" --verbose
printf "COMPLETED **** PLAN : $myoutfilename \n \n"

read -p "Do you want to apply? (yes/no)?" doapply
printf "\n \n"
if [ "$doapply" = "yes" ]
then
    printf "INITIATED **** APPLY : $myoutfilename \n \n"
    terraform apply -no-color | tee -a "$mylogfilename-applied.log"
    # terraform apply -state="$myoutfilename" -no-color | tee -a "$mylogfilename-applied.log"
    printf "COMPLETED **** APPLY : $myoutfilename \n \n"
fi
