#!/bin/bash

# Default port
PORT=80

echo "Starting up delighted ..."

if [ "$1" != "" ]; then
    PORT=$1
fi

docker run --name delighted_$PORT -dp $PORT:80 promedia/delighted