#!/usr/bin/env bash
set -euo pipefail

templogfile=$(mktemp)
trap 'rm -f "$templogfile"' EXIT
count=0
abovecnt=0
servers_filename=""
threshold=""

while getopts ":f:t:" opt; do
    case $opt in
        f)
            servers_filename="$OPTARG"   
        ;;
        t)
            threshold="$OPTARG" 
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

if [[ -z "$servers_filename" || -z "$threshold" ]]; then
    echo "servers file or threshold args is empty"
    exit 1
fi

check_server(){
    local use=$(df / | awk 'NR==2 {print $5}')
    if [[ "$threshold" -lt "${use//%/}" ]]; then
        echo "[WARN] $1: disk at $use (above threshold)" >> "$templogfile"
        ((++abovecnt))
    else
        echo "[OK] $1: disk at $use" >> "$templogfile"
    fi
}

while IFS= read -r line; do

    check_server "$line"
    ((++count))
done < "$servers_filename"




cat "$templogfile"

echo "Total checked servers: $count"
echo "Total above threshold: $abovecnt"