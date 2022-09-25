#!/bin/bash

mydatetimenow=$(date  -u +"%Y-%m-%dT%H:%M:%SZ")
printf "INITIATED:PLAN: $mydatetimenow \n \n \n"
# terraform plan -out=".output/tfplan-$mydatetimenow" | tee -a ".output/plan-$mydatetimenow.log"
terraform plan -out=".output/tfplan-$mydatetimenow" | iconv --to-code=UTF-8 --output=".output/plan-$mydatetimenow.log" --verbose
printf "OUTPUT:FILE: .output/tfplan-$mydatetimenow \n \n \n"
printf "COMPLETED:PLAN: $mydatetimenow \n \n \n"

# terraform show ".output/tfplan - $mydatetimenow"
