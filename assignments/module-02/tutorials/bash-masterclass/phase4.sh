#!/usr/bin/env bash

services=("nginx" "mysql" "redis" "unknown-svc")
log_files=("app.log" "error.log" "debug.log")

for service in "${services[@]}"; do
    if [[ "$service" == "unknown-svc" ]]; then
        echo "Skipping: $service"
        continue
    else
        echo "Processing: $service"
    fi
done

for log in "${log_files[@]}"; do
    if [[ "$log" == "error.log" ]]; then
        echo "Found critical log: $log. Stopping."
        break
    else
        echo "Processing: $log"
    fi
done

for env in "prod" "staging"; do
    for server in "web-01" "web-02"; do
        if [[ "$env" == "staging" && "$server" == "web-02" ]]; then
            break 2
        else
            echo "Deploying to $server in $env"
        fi
    done
done