#!/usr/bin/env bash

name="sharif"

ENVIRONMENT="production"

echo "Hello, my name is $name and I work in $ENVIRONMENT environment"

today=$(date +%Y-%m-%d)

echo "Today's date is $today"

echo 'Hello, $name'

servers=3
replicas=5

echo "Total servers and replicas: $((servers+replicas))"