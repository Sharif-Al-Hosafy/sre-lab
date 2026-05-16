#!/usr/bin/env bash

filename=$1

if [[ -z "$filename" ]]; then
    echo "Usage Error: missing filename"
    exit 1
elif [[ ! -e "$filename" ]]; then
    echo "file doesn't exist"
    exit 1
elif [[ -e "$filename" && ! -s "$filename" ]]; then
    echo "WARN: file is empty"
    exit 2
elif [[ -e "$filename" && -s "$filename" ]]; then
    echo "File is ready: $filename"
fi