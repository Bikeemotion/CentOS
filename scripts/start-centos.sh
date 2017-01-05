#!/bin/bash

source environment_variables.temp > /dev/null 2>&1 || { echo -e "\nYou need to create your temporary environment_variables.temp based of environment_variables.tmpl!!!\n" && exit 1; }

docker stats --no-stream be-centos  > /dev/null 2>&1
if [[ "$?" -eq 0 ]]; then
  docker start \
    --attach \
    --interactive \
    be-centos 
else
  docker run \
    --interactive \
    --hostname docker-centos \
    --name be-centos \
    --tty \
    ${REGISTRY}centos${IMAGE_TAG}
fi
