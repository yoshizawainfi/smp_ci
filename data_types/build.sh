#!/bin/bash

which protoc > /dev/null 2>&1
if [ $? != 0 ]; then
  echo 'You need to have protoc command in your path.'
  echo 'You can get it from: https://github.com/google/protobuf/releases'
  exit
fi

PROTO_DIR="../proto"

if [ -z "$1" ]; then
  directory="."
else
  directory="proto/data_types/$1"
fi

find ${directory} -name \*.proto | xargs protoc -I . --python_out=${PROTO_DIR}/..

# create __init__.py if it does not exist.
find ${PROTO_DIR}/data_types -type d \! -name __\* -exec touch {}/__init__.py \;
