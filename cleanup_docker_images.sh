#!/bin/bash

echo "Cleaning up docker images"

docker rmi -f $(docker images | grep "^<none>" | awk '{print $3}')