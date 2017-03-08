#!/bin/sh
. ./env.sh

ps -ef | grep java | grep "\[SERVER_NAME=$SERVER_NAME\]" | awk {'print "jstat -gcutil " $2 " 1000 0"'} | sh -x
