#!/bin/bash

### utility bash script
### @author   rkaneko
### @createAt 2014/07/05

LOG_LABEL_INFO='[INFO]: '
LOG_LABEL_ERROR='[ERROR]: '

existArg1()
{
    local EXIST_ARG1=false
    # See if $1's length greater than 0 .
    if [ $1 ]
    then
        local EXIST_ARG1=true
    fi
    echo ${EXIST_ARG1}
}

existCmd()
{
    if [ `existArg1 $1` = false ]
    then
        echo false
        return
    fi

    local SOME_CMD=$1
    local PATH_TO_CMD=`which ${SOME_CMD}`
    local IS_EXIST=false
    if [ ${#PATH_TO_CMD} -ge ${#SOME_CMD} ]
    then
        local IS_EXIST=true
    fi
    echo ${IS_EXIST}
}
