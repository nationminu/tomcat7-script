#!/bin/sh
. ./env.sh

ps -ef | grep java | grep "\[SERVER_NAME=$SERVER_NAME\]" | awk {'print "kill -9 " $2'} | sh -x
