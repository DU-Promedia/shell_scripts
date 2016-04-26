#!/bin/bash

# Removes all exited containers
exited=$(docker rm $(docker ps -q -f status=exited))

if [ -z "$exited" ]; then
	# Start up the ones we want
	docker run -d --name=grabberd_na promedia/grabberd:1.0 one na
	docker run -d --name=grabberd_vlt promedia/grabberd:1.0 one vlt
	docker run -d --name=grabberd_nt promedia/grabberd:1.0 one nt
	docker run -d --name=grabberd_lt promedia/grabberd:1.0 one lt
fi
