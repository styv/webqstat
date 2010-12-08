#!/bin/bash

# qstat.cgi - job list script
# (c) 2010 steffen@earthlingsoft.net

. ./config.sh

OWNER=${1//\\\*/*}
if [ -z $OWNER ]
then
   OWNER=*
fi

echo Content-type: text/html
echo

$QSTAT -xml -u "$OWNER" | $XSLTPROC --stringparam owner "${1//\\\*/*}" qstat.xsl -
