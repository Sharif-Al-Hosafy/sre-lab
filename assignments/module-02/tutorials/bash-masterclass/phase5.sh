#!/usr/bin/env bash

greet_user(){
    local name=$1
    echo "Hello, $name Welcome to SRE team."
}

check_disk(){
    local path=$1
    local disk_usage=$(df "$path" | awk 'NR==2 {print $5}')
    echo "Disk Usage for $path: $disk_usage"
}

validate_env(){
    local env=$1
    if [[ "$env" != "staging" && "$env" != "prod" ]]; then
        echo "$env is not a valid Environment"
        return 1
    else
        echo "$env is a valid Environment"
    fi
}

greet_user "Sharif"
check_disk "/"
validate_env "plod"
validate_env "prod"