#!/bin/sh

# queue.cgi - queue instance overview script
# (c) 2010 steffen@earthlingsoft.net

. ./config.sh

echo Content-type: text/html
echo

$QSTAT -F load_avg -explain aAcE -xml | $XSLTPROC queue.xsl -
