#!/bin/bash

# TOOD: Unregister from load balancer

DID_PERFORM_UPDATE=$(docker pull promedia/delighted | grep "up to date") 

if [ ! -z "$DID_PERFORM_UPDATE" -a "$DID_PERFORM_UPDATE" != " " ]; then
    echo "It's up to date. No restart needed."
else
    echo "Image has been updated. Restart"
	docker kill $(docker ps | grep "delighted" | awk '{print $1}')
	docker run -dp 80:80 promedia/delighted
fi

# TODO: Health check instance, if not health roll back or fall on the ground dead?

# TODO: Add to load balancer