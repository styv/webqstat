#!/bin/bash

# qstatqueue.cgi - job list script
# (c) 2010 steffen@earthlingsoft.net

. ./config.sh

QUEUE=${1//\\\*/*}
if [ -z $QUEUE ]
then
   QUEUE=*
fi

echo Content-type: text/html
echo

$QSTAT -xml -u "*" -q "${QUEUE}" -s rs | $XSLTPROC --stringparam queue "${1//\\\*/*}" qstat.xsl -
