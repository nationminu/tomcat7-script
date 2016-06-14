#!/bin/sh
. ./env.sh

unset JAVA_OPTS

ps -ef | grep java | grep "\[SERVER_NAME=$SERVER_NAME\]" --color
