<?xml version="1.0" encoding="UTF-8"?>

<!-- queue.xsl - queue instance overview xsl stylesheet
   (c) 2010 steffen@earthlingsoft.net
-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="utf-8"/>

<xsl:include href="common.xsl"/>

<xsl:template match="/">
  <html>
  <head>
  <title>Queue Overview</title>
  <link type="text/css" rel="Stylesheet" media="screen" href="webqstat.css" />
  </head>
  <body>
    <h1>Queue Overview</h1>
    <p>
    <xsl:copy-of select="$webqstat-navigation"/>
    </p>
    <table>
    <tr>
      <th>queue</th>
      <th>instance</th>
      <th>usage</th>
      <th>load_avg</th>
      <th>arch</th>
      <th>state</th>
    </tr>
    <xsl:for-each select="job_info/queue_info/Queue-List">
    <tr>
      <xsl:if test="contains(state,'u') or contains(state,'d')">
      <xsl:attribute name="class">queueDisabledOrUnavailable</xsl:attribute>
      </xsl:if>
      <td><a>
      <xsl:attribute name="href"><xsl:value-of select="$qstatqueue-href"/>?<xsl:value-of select="substring-before(name,'@')"/>@*</xsl:attribute>
      <xsl:value-of select="substring-before(name,'@')"/>
      </a></td>
      <td><a>
      <xsl:attribute name="href"><xsl:value-of select="$qstatqueue-href"/>?*@<xsl:value-of select="substring-after(name,'@')"/></xsl:attribute>
      <xsl:call-template name="basenameForHostname">
         <xsl:with-param name="host"><xsl:value-of select="substring-after(name,'@')"/></xsl:with-param>
      </xsl:call-template>
      </a></td>
      <td class="progress"><div class="progressFrame">
         <div class="progressBar">
            <xsl:attribute name="style">width: <xsl:value-of select="100 * slots_used div slots_total"/>%</xsl:attribute>
            <div class="progressText"><xsl:value-of select="slots_used"/>/<xsl:value-of select="slots_total"/></div>
         </div>
         
      </div></td>
      <td style="text-align: right;"><xsl:if test="resource[@name='load_avg']"><xsl:value-of select="format-number(resource[@name='load_avg'], '0.00')"/></xsl:if></td>
      <td><xsl:value-of select="arch"/></td>
      <td>
      <xsl:choose>
      <xsl:when test="load-alarm-reason">
      <div>
      <xsl:attribute name="title"><xsl:value-of select="translate(load-alarm-reason,'&#x9;','')"/></xsl:attribute>
      <xsl:value-of select="state"/>
      </div>
      </xsl:when>
      <xsl:otherwise>
      <xsl:value-of select="state"/>
      </xsl:otherwise>
      </xsl:choose>
      </td>
    </tr>
    </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>