#!/bin/sh
BASEDIR=$(dirname "$0")
. $BASEDIR/env.sh

LOG_DATE=`date +%Y-%m-%d`

# ------------------------------------
PID=`ps -ef | grep java | grep "=$SERVER_NAME" | awk '{print $2}'`

if [ e$PID == "e" ]
then
    echo "JBOSS($SERVER_NAME) is not RUNNING..."
    exit;
fi
# ------------------------------------
UNAME=`id -u -n`
if [ e$UNAME != "e$SERVER_USER" ]
then
    echo "$SERVER_USER USER to start JBoss SERVER - $SERVER_NAME..."
    exit;
fi
# ------------------------------------

unset JAVA_OPTS

$CATALINA_HOME/bin/catalina.sh stop 
