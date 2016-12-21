#!/bin/bash

docker stats --no-stream centos  > /dev/null 2>&1
if [[ "$?" -eq 0 ]]; then
  docker start \
    --attach \
    --interactive \
    centos 
else
  docker run \
    --interactive \
    --hostname docker-centos \
    --name centos \
    --tty \
    bikeemotion/centos:latest-localdockers
fi
