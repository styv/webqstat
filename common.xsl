<?xml version="1.0" encoding="UTF-8"?>

<!-- common.xsl - common stuff
   (c) 2010 steffen@earthlingsoft.net
-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="qstat-href">qstat.cgi</xsl:variable>
<xsl:variable name="qhost-href">qhost.cgi</xsl:variable>
<xsl:variable name="queue-href">queue.cgi</xsl:variable>
<xsl:variable name="help-href">help.html</xsl:variable>
<xsl:variable name="job-href">job.cgi</xsl:variable>
<xsl:variable name="qstatqueue-href">qstatqueue.cgi</xsl:variable>


<xsl:variable name="webqstat-navigation">
<a><xsl:attribute name="href"><xsl:value-of select="$qstat-href"/></xsl:attribute>Job Overview</a>
| <a><xsl:attribute name="href"><xsl:value-of select="$queue-href"/></xsl:attribute>Queue Overview</a>
| <a><xsl:attribute name="href"><xsl:value-of select="$qhost-href"/></xsl:attribute>Host Overview</a>
| <a><xsl:attribute name="href"><xsl:value-of select="$help-href"/></xsl:attribute>Help</a>
</xsl:variable>

<xsl:template name="basenameForHostname">
<xsl:param name="host" />
   <xsl:choose>
      <xsl:when test="contains($host,'.')">
         <xsl:value-of select="substring-before($host,'.')"/>
      </xsl:when>
      <xsl:otherwise>
         <xsl:value-of select="$host"/>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

</xsl:stylesheet>