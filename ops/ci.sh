#!/bin/bash

trap cleanup EXIT

function cleanup {
  docker_cleanup | true
}

function docker_cleanup {
  docker rm smp_ci
  # docker images | grep smp_ci | awk '{print $3}' | xargs docker rmi
  docker network rm smp-ci-nw
}

# gcloud docker -- pull asia.gcr.io/dev-infitec/smp_ci:latest

docker network create smp-ci-nw | true

docker run --net=smp-ci-nw\
    --name smp_ci asia.gcr.io/dev-infitec/smp_ci:latest \
    /bin/sh -c "./run_nose_test.sh"
