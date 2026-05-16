#!/usr/bin/env bash
count=0

if [[ ! -e "/tmp/services.txt" ]]; then
    echo "creating services file..."
    printf "nginx\nmysql\nredis\n" > /tmp/services.txt 
fi

while IFS= read -r line; do
    echo "checking service: $line"
    ((count++))
done < /tmp/services.txt

echo "Number of lines: $count"