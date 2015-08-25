#!/bin/bash

SCRIPT_PWD="$(dirname "$0")"

PARAMETERS_FILE=$SCRIPT_PWD/parameters.sh

bin/build-web.sh $PARAMETERS_FILE && \
bin/build-compose.sh $PARAMETERS_FILE && \
docker-compose build
