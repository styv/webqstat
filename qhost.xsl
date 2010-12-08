<?xml version="1.0" encoding="UTF-8"?>

<!-- qhost.xsl - host overview xsl stylesheet
   (c) 2010 steffen@earthlingsoft.net
-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="utf-8"/>

<xsl:include href="common.xsl"/>

<xsl:template match="/">
  <html>
  <head>
  <title>Host Overview</title>
  <link type="text/css" rel="Stylesheet" media="screen" href="webqstat.css" />
  </head>
  <body>
    <h1>Host Overview</h1>
    <p>
    <xsl:copy-of select="$webqstat-navigation"/>
    </p>
    <table>
    <tr>
      <th>host</th>
      <th>arch</th>
      <th>num_proc</th>
      <th>load_avg</th>
      <th>mem_total</th>
      <th>mem_used</th>
      <th>swap_total</th>
      <th>swap_used</th>
    </tr>
    <xsl:for-each select="qhost/host">
    <tr>
      <td>
      <xsl:choose>
      <xsl:when test="@name != 'global'">
      <a><xsl:attribute name="href"><xsl:value-of select="$qstatqueue-href"/>?*@<xsl:value-of select="@name"/></xsl:attribute>
      <xsl:call-template name="basenameForHostname">
         <xsl:with-param name="host"><xsl:value-of select="@name"/></xsl:with-param>
      </xsl:call-template>
      </a>
      </xsl:when>
      <xsl:otherwise>
      <xsl:call-template name="basenameForHostname">
         <xsl:with-param name="host"><xsl:value-of select="@name"/></xsl:with-param>
      </xsl:call-template>
      </xsl:otherwise>
      </xsl:choose>
      </td>
      <td><xsl:value-of select="hostvalue[@name='arch_string']"/></td>
      <td style="text-align:right;"><xsl:value-of select="hostvalue[@name='num_proc']"/></td>
      <td style="text-align:right;"><xsl:value-of select="hostvalue[@name='load_avg']"/></td>
      <td style="text-align:right;"><xsl:value-of select="hostvalue[@name='mem_total']"/></td>
      <td style="text-align:right;"><xsl:value-of select="hostvalue[@name='mem_used']"/></td>
      <td style="text-align:right;"><xsl:value-of select="hostvalue[@name='swap_total']"/></td>
      <td style="text-align:right;"><xsl:value-of select="hostvalue[@name='swap_used']"/></td>
    </tr>
    </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>