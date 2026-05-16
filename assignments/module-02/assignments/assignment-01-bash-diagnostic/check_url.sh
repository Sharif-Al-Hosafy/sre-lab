#!/usr/bin/env bash
set -euo pipefail

url=""
while getopts ":u:" opt; do
    case $opt in
        u)
            url=$OPTARG
        ;;
        :)
            echo "Error: Option -$OPTARG requires an argument."
            exit 1
        ;;
        \?)
            echo "Error: Invalid option -$OPTARG"
            exit 1
      ;;
    esac
done

if [[ -z "$url" ]]; then
    echo "URL can't be empty. Exiting..."
    exit 1
fi

code=$(curl -si "$url" | awk 'NR==1 {print $2}') || { echo "Error: could not reach $url"; exit 1; }

if [[ "$code" != "200" ]]; then
    echo "status code:$code isn't equal 200"
    exit 1
else
    echo "$code"
fi