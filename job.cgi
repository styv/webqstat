#!/bin/sh

# job.cgi - job detail script
# (c) 2010 steffen@earthlingsoft.net

. ./config.sh

echo Content-type: text/html
echo

$QSTAT -xml -j $1 | $XSLTPROC job.xsl -
