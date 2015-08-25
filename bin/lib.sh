#!/bin/bash

function escape_spaces {
    echo $(echo "$1" | sed 's/ /\\ /g')
}

function run_and_exit_on_fail {
    C=''
    for i in "$@"; do 
        C="$C \"${i//\"/\\\"}\""
    done

    bash -c "$C"
    if [ $? -gt 0 ]; then
        echo "$C command failed. Stopping process."
        clean
        exit 1
    fi
}

function load_parameters {
    PARAMETERS_FILE=$1
    run_and_exit_on_fail file $PARAMETERS_FILE > /dev/null
    source $PARAMETERS_FILE
    DOCKER_SERVERNAME=$(escape_spaces "$DOCKER_SERVERNAME")
}
