#!/bin/bash

echo "Updating grabberd ..."

DID_PERFORM_UPDATE=$(docker pull kentos/grabberd | grep "up to date") 

if [ ! -z "$DID_PERFORM_UPDATE" -a "$DID_PERFORM_UPDATE" != " " ]; then
    echo "It's up to date. No restart needed."
else
    echo "Image has been updated. Restart"
	docker kill $(docker ps | grep "grabberd" | awk '{print $1}')
	docker run -d kentos/grabberd
fi