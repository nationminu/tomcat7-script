#!/bin/sh
BASEDIR=$(dirname "$0")
. $BASEDIR/env.sh

# ------------------------------------
PID=`ps -ef | grep java | grep "=$SERVER_NAME" | awk '{print $2}'`
echo $PID 
   
if [ e$PID != "e" ]
then
    echo "Oops! Tomcat($SERVER_NAME) is already RUNNING..."
    exit; 
fi
# ------------------------------------
UNAME=`id -u -n`
if [ e$UNAME != "e$SERVER_USER" ]
then
    echo "Oops! $SERVER_USER USER must allowed to start $SERVER_NAME Server ..."
    exit;
fi
# ------------------------------------

if [ ! -d "$LOG_DIR/gclog" ];
then
    mkdir -p $LOG_DIR/gclog
fi
if [ ! -d "$LOG_DIR/nohup" ];
then
    mkdir -p $LOG_DIR/nohup
fi

# Scouter Options
SCOUTER_HOME=../../../../scouter.0.4.14
JAVA_OPTS="$JAVA_OPTS -javaagent:$SCOUTER_HOME/agent.java/scouter.agent.jar"
JAVA_OPTS="$JAVA_OPTS -Dscouter.config=$SCOUTER_HOME/agent.java/tomcat-simple.conf"

mv $LOG_DIR/gclog/${SERVER_NAME}_gc.log $LOG_DIR/gclog/${SERVER_NAME}_gc.log.$DATE
mv $LOG_DIR/nohup/${SERVER_NAME}.out $LOG_DIR/nohup/${SERVER_NAME}.out.$DATE

nohup $CATALINA_HOME/bin/catalina.sh run >> $LOG_DIR/nohup/$SERVER_NAME.out 2>&1 & 
