#!/bin/bash

### Script for installing tpm
### @author    rkaneko
### @createdAt 2014/9/15

PARENT_DIR=`dirname $0`

# include
. ${PARENT_DIR}/sh/util.sh


installTpm()
{
    cat <<_EOT_
${LOG_LABEL_INFO}invoking installTpm() ...
_EOT_

    if [ `existArg1 $1` = false ]
    then
        cat <<_EOT_
You should give one parameter for invoking installTpm()
ex) FOO=`echo pwd`
    \`installTpm \$FOO\`
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

    PATH_2_TPM=$HOME/.tmux/plugins/tpm
    URL_2_TPM="https://github.com/tmux-plugins/tpm.git"

    if [ -d ${PATH_2_TPM} ]
    then
        cat <<_EOT_
${LOG_LABEL_INFO}${PATH_2_TPM} already exists.
${LOG_LABEL_INFO}STOP! git clone ${URL_2_TPM}
_EOT_
        exit 1
    fi

    git clone ${URL_TO_TPM} ${PATH_2_TPM}
}
