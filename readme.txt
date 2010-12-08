WebQstat
========

(c) 2010 steffen@earthlingsoft.net


What is WebQstat?
-----------------

WebQstat is a set of cgi scripts and xsl stylesheets for displaying sun
gridengine job and queue information via the web.


Feedback
--------

If you have any bug reports, have added new features, or if you have any other
question or comment, you can reach me at: steffen@earthlingsoft.net


Requirements
------------

- bash
- gridengine
- xsltproc
- webserver (e.g. Apache)


Installation
------------

1. Copy all WebQstat files to a directory on your web server
2. Make sure all .cgi files can be executed by the web server and all other
   files are readable by the web server
3. Modify the file 'config.sh', instructions are provided in the file
4. Modify the file 'webqstat.conf', instructions are provided in the file
5. Restart Apache


Customisation
-------------

If you need WebQstat to be accessible from outside your intranet or VPN, you
should probably use some kind of authentication method (e.g. htaccess/htpasswd).
See also the section "Security considerations" below.

If you want to rename the .cgi files (e.g. remove the .cgi file extension), make
sure to adjust the corresponding variables in "common.xsl" and apache directives
in "webqstat.conf". (Note: You shoule not need to rename "config.sh", but if you
really want to, you must adjust the reference to this file in each of the .cgi
files.)


Security considerations
-----------------------

WebQstat uses command line tools for gathering and converting data. It has
not been developed with security in mind and has not been tested for possible
weaknesses. So please use it at your own risk - it may be a good idea to
restrict access to your intranet or only allow authenticated access.


Version history
---------------

Consult the "history.txt" file for a version history of WebQstat.