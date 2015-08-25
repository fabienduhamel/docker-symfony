#!/bin/bash

SCRIPT_PWD="$(dirname "$0")"

source $SCRIPT_PWD/lib.sh

DOCKER_COMPOSE_FILE_DIST=$SCRIPT_PWD/dist/docker-compose.yml.dist
DOCKER_COMPOSE_TMP_FILE=$SCRIPT_PWD/../docker-compose.yml.tmp
DOCKER_COMPOSE_FILE=$SCRIPT_PWD/../docker-compose.yml

function clean {
    if [ -f $DOCKER_COMPOSE_TMP_FILE ]; then
        rm -f $DOCKER_COMPOSE_TMP_FILE
    fi
}

load_parameters $1
run_and_exit_on_fail cp $DOCKER_COMPOSE_FILE_DIST $DOCKER_COMPOSE_TMP_FILE
run_and_exit_on_fail sed -i "s^##DOCKER_WEBSITE_NAME##^$DOCKER_WEBSITE_NAME^g" $DOCKER_COMPOSE_TMP_FILE
run_and_exit_on_fail sed -i "s^##DOCKER_WEB_LISTENING_PORT##^$DOCKER_WEB_LISTENING_PORT^g" $DOCKER_COMPOSE_TMP_FILE
run_and_exit_on_fail sed -i "s^##DOCKER_DB_PASSWORD##^$DOCKER_DB_PASSWORD^g" $DOCKER_COMPOSE_TMP_FILE
run_and_exit_on_fail sed -i "s^##DOCKER_WWW_PATH##^$DOCKER_WWW_PATH^g" $DOCKER_COMPOSE_TMP_FILE
run_and_exit_on_fail mv $DOCKER_COMPOSE_TMP_FILE $DOCKER_COMPOSE_FILE

echo "$DOCKER_COMPOSE_FILE builded successfully."
exit 0
