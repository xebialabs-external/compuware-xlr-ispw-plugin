#!/bin/sh
#
# Copyright 2020 XEBIALABS
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

####################### ISPW server data


wget --http-user=admin --http-password=admin --auth-no-challenge \
     --header="Accept: application/json" \
     --header="Content-type: application/json" \
     --post-file=$SCRIPTPATH/data/server-config.json \
    http://localhost:15516/api/v1/config -O /dev/null

wget --http-user=admin --http-password=admin --auth-no-challenge \
     --header="Accept: application/json" \
     --header="Content-type: application/json" \
     --post-file=$SCRIPTPATH/data/mock-server-config.json \
    http://localhost:15516/api/v1/config -O /dev/null


##### Insert template

wget --http-user=admin --http-password=admin --auth-no-challenge \
     --header="Accept: application/json" \
     --header="Content-type: application/json" \
     --post-file=$SCRIPTPATH/data/release-template.json \
    http://localhost:15516/api/v1/templates/import -O /dev/null

wget --http-user=admin --http-password=admin --auth-no-challenge \
     --header="Accept: application/json" \
     --header="Content-type: application/json" \
     --post-file=$SCRIPTPATH/data/pollGetSetDeployInfoTemplate.json \
    http://localhost:15516/api/v1/templates/import -O /dev/null

wget --http-user=admin --http-password=admin --auth-no-challenge \
     --header="Accept: application/json" \
     --header="Content-type: application/json" \
     --post-file=$SCRIPTPATH/data/pollGetSetInfoTemplate.json \
    http://localhost:15516/api/v1/templates/import -O /dev/null

wget --http-user=admin --http-password=admin --auth-no-challenge \
     --header="Accept: application/json" \
     --header="Content-type: application/json" \
     --post-file=$SCRIPTPATH/data/test409ReturnRetry-GetReleaseInfoTemplate.json \
    http://localhost:15516/api/v1/templates/import -O /dev/null

