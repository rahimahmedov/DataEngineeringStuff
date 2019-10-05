#!/bin/bash

if [ $# -eq 2 ] && [ $2 == "--reset" ]
then
    case $1 in
        namenode )
            echo " >>>> Formatting name node .... >>>>"
            hdfs namenode -format -force
            ;;
        datanode )
            echo " >>>> deleting data  .... >>>>"
            rm -rf /dn/*
            ;;
    esac
fi

echo " >>>> Starting $1 service .... >>>>"
rm -f /tmp/*.pid

if [ $1 == namenode ]
then
    if ! [ -f /nn/current/VERSION ]
    then
        hdfs namenode -format -force
    fi
fi
hdfs $1
