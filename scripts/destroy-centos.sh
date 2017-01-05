#!/bin/bash

docker inspect be-centos  > /dev/null 2>&1
if [[ "$?" -eq 0 ]]; then
  docker kill be-centos > /dev/null 2>&1; \
    docker rm be-centos > /dev/null 2>&1
fi
