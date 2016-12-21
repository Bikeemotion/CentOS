#!/bin/bash

docker inspect centos  > /dev/null 2>&1
if [[ "$?" -eq 0 ]]; then
  docker kill centos > /dev/null 2>&1
  docker rm centos > /dev/null 2>&1
fi
