#!/bin/bash

echo "Updating grabberd ..."

docker pull kentos/grabberd
docker kill grabberd
docker run --name grabberd -dp 9000:9000 kentos/grabberd