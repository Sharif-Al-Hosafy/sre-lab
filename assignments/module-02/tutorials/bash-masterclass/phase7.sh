#!/usr/bin/env bash
declare -A services

services[nginx]="80"
services[redis]="6379"
services[mysql]="3306"

for service in "${!services[@]}"; do
    echo "$service is running on port ${services[$service]}"
done 

services[grafana]="3000"

echo "Array total number is: ${#services[@]}"