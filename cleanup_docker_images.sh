#!/bin/sh

echo "Cleaning Docker Images"
docker rmi -f $(docker images | grep "^<none>" | awk '{print $3}')

echo "REALLY Cleaning Docker Images"
docker rm -v $(docker ps -a -q -f status=exited)
