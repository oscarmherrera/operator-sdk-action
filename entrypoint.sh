#!/bin/bash

set -e

unset GOROOT

IMAGE="$1"
TAG="${2:-latest}"
DIR="${3:-$PWD}"
ARGS="${4}"
RELEASE_VERSION:"${5:-v0.19.2}"

if [ -z "$IMAGE" ]; then
  echo 'Image name is required'
  exit 1
fi

echo "INFO: Using operator-sdk version $RELEASE_VERSION"
echo "INFO: Building in directory $DIR"
echo "INFO: Building image $IMAGE/$TAG"

cd "$DIR"

curl -L -o /usr/local/bin/operator-sdk "https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu"

chmod +x /usr/local/bin/operator-sdk

operator-sdk build "$IMAGE:$TAG" $ARGS

echo ::set-output name=image::"$IMAGE:$TAG"
