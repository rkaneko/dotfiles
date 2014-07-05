#!/bin/bash

### Script for installing neobundle.vim.
### @author    rkaneko
### @createdAt 2014/7/5

PARENT_DIR=`dirname $0`

# include
. ${PARENT_DIR}/sh/util.sh


installNeoBundle()
{
    cat <<_EOT_
${LOG_LABEL_INFO}invoking installNeoBundle() ...
_EOT_

    if [ `existArg1 $1` = false ]
    then
        cat <<_EOT_
You should give one parameter for invoking installNeoBundle()
ex) FOO=`echo pwd`
    \`installNeoBundle \$FOO\`
_EOT_
        exit 1
    fi

    local EXIST_GIT=`existCmd git`
    if [ ${EXIST_GIT} = 'false' ]
    then
        cat <<_EOT_
${LOG_LABEL_ERROR}Not found git command .
${LOG_LABEL_ERROR}You should add path2git to PATH .
_EOT_
        exit 1
    fi

    NAME_NEOBUNDLE='neobundle.vim'
    DIR_BUNDLE='.vim/bundle'
    # PATH_2_PLUGIN_DIR=$1/${DIR_BUNDLE}
    PATH_2_NEOBUNDLE=$1/${DIR_BUNDLE}/${NAME_NEOBUNDLE}

    # If ${PATH_2_NEOBUNDLE}R directory doesn\'t exist, make directory .
    # if [ ! -d ${PATH_2_PLUGIN_DIR} ]
    # then
    #     mkdir -p ${PATH_2_PLUGIN_DIR}
    # fi

    URL_TO_NEOBUNDLE='https://github.com/Shougo/'${NAME_NEOBUNDLE}'.git'

    if [ -d ${PATH_2_NEOBUNDLE} ]
    then
        cat <<_EOT_
${LOG_LABEL_INFO}${PATH_2_NEOBUNDLE} already exists.
${LOG_LABEL_INFO}STOP! git clone ${URL_TO_NEOBUNDLE}
_EOT_
        exit 1
    fi

    git clone ${URL_TO_NEOBUNDLE} ${PATH_2_NEOBUNDLE}
}
