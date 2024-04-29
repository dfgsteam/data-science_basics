#!/bin/bash
TIME=$2
PID=$1
while true; do
        if ps -q $PID > /dev/null ; then
                echo "$PID is running."
        else
                echo "$PID is not running."
        fi
        sleep $TIME
done
