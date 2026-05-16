#!/usr/bin/env bash

servers=("web-01" "web-02" "db-01")
count=1
filesrc="./tmp/ready.flag"

for server in "${servers[@]}"; do
    echo "checking server: $server"
done

while [[ "$count" -le 5 ]]; do
    echo "Count: $count"
    ((count++))
done

until [[ -e "$filesrc" ]]; do
    echo "Waiting for flag"
    sleep 5
done

echo "Flag detected. Continuing"