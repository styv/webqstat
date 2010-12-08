#!/bin/sh

# qhost.cgi - host overview script
# (c) 2010 steffen@earthlingsoft.net

. ./config.sh

echo Content-type: text/html
echo

$QHOST -xml | $XSLTPROC qhost.xsl -
