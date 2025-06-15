#!/bin/bash
set -o xtrace
PS4='${LINENO}: '

# https://askubuntu.com/questions/583797/how-to-set-a-proxy-for-terminal/584183#584183
export http_proxy='http://192.168.1.100:8080'
export HTTP_PROXY='http://192.168.1.100:8080'
export https_proxy='https://192.168.1.100:8080'
export HTTPS_PROXY='https://192.168.1.100:8080'

set | grep -i proxy

set +o xtrace