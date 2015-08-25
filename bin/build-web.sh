#!/bin/bash

SCRIPT_PWD="$(dirname "$0")"

source $SCRIPT_PWD/lib.sh

NGINX_DIST_CONF_FILE=$SCRIPT_PWD/dist/nginx.conf.dist
NGINX_TMP_CONF_FILE=$SCRIPT_PWD/dist/nginx.conf.tmp
NGINX_CONF_FILE=$SCRIPT_PWD/../images/web/nginx.conf

function clean {
    if [ -f $NGINX_TMP_CONF_FILE ]; then
        rm -f $NGINX_TMP_CONF_FILE
    fi
}

load_parameters $1
run_and_exit_on_fail cp $NGINX_DIST_CONF_FILE $NGINX_TMP_CONF_FILE
run_and_exit_on_fail sed -i "s^##DOCKER_SERVERNAME##^$DOCKER_SERVERNAME^g" $NGINX_TMP_CONF_FILE
run_and_exit_on_fail sed -i "s^##DOCKER_WEB_ROOT_DIR##^$DOCKER_WEB_ROOT_DIR^g" $NGINX_TMP_CONF_FILE
run_and_exit_on_fail sed -i "s^##DOCKER_WEBSITE_NAME##^$DOCKER_WEBSITE_NAME^g" $NGINX_TMP_CONF_FILE
run_and_exit_on_fail mv $NGINX_TMP_CONF_FILE $NGINX_CONF_FILE

echo "$NGINX_CONF_FILE builded successfully."
exit 0
