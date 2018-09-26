#!/bin/bash

set -ex

TAG=$1
DOCKERFILE_PATH=$2

NAMESPACE="kusid"
REPOSITORY="herd-xdl"


login_hub() {
  echo "Logging onto docker hub."
  docker login --username=${DOCKERHUB_USER} --password=${DOCKERHUB_PASS} --email=kusid@kusid.org
}


build() {
  echo "Building image"
  docker build -t ${NAMESPACE}/${REPOSITORY}:${TAG} ${DOCKERFILE_PATH}
}

push() {
  echo "Publishing image to docker hub"
  docker push ${NAMESPACE}/${REPOSITORY}:${TAG}
}


login_hub
build
push
