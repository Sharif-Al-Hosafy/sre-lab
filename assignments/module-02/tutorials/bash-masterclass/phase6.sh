#!/usr/bin/env bash

while getopts ":e:s:" opt; do
    case $opt in
        e)
            ENV="$OPTARG"
        ;;
        s)
            SERVICE="$OPTARG"
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

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 -e <prod|dev|staging> -s <service>"
    exit 1
fi

if [[ "$ENV" != "prod" && "$ENV" != "dev" && "$ENV" != "staging" ]]; then
    echo "Error -e should be prod, staging or dev"
    exit 1
elif [[ -z "$SERVICE" ]]; then
    echo "Error -s can't be empty"
    exit 1
else
    echo "Deploying $SERVICE to $ENV"
fi