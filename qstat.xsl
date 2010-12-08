<?xml version="1.0" encoding="UTF-8"?>

<!-- qstat.xsl - job list xsl stylesheet
   (c) 2010 steffen@earthlingsoft.net
-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="utf-8"/>

<xsl:include href="common.xsl"/>

<xsl:param name="owner"/>
<xsl:param name="queue"/>

<xsl:template match="/">

  <html>
  <head>
  <title>
    Job Overview
    <xsl:if test="$owner">
    for user <xsl:value-of select="$owner"/>
    </xsl:if>
    <xsl:if test="$queue">
    for queue <xsl:value-of select="$queue"/>
    </xsl:if>
  </title>
  <link type="text/css" rel="Stylesheet" media="screen" href="webqstat.css" />
  </head>
  <body>
    <h1>
      Job Overview
      <xsl:if test="$owner">
      for user <xsl:value-of select="$owner"/>
      </xsl:if>
      <xsl:if test="$queue">
      for queue <xsl:value-of select="$queue"/>
      </xsl:if>
    </h1>
    <p>
    <xsl:copy-of select="$webqstat-navigation"/>
    </p>
    <p>
    (<xsl:value-of select="count(job_info/queue_info/job_list)"/> active<xsl:if test="not($queue)">, <xsl:value-of select="count(job_info/job_info/job_list)"/> pending</xsl:if>)
    </p>
    <h2>Active Jobs</h2>
    <table>
    <tr>
      <th>jobID</th>
      <th>owner</th>
      <th>name</th>
      <th>task</th>
      <th>queue</th>
      <th>slots</th>
      <th>startTime</th>
      <th>priority</th>
      <th>state</th>
    </tr>
    <xsl:for-each select="job_info/queue_info/job_list">
    <tr>
      <td><a>
         <xsl:attribute name="href"><xsl:value-of select="$job-href"/>?<xsl:value-of select="JB_job_number"/></xsl:attribute>
         <xsl:value-of select="JB_job_number"/>
      </a></td>
      <td><a>
         <xsl:attribute name="href">?<xsl:value-of select="JB_owner"/></xsl:attribute>
         <xsl:value-of select="JB_owner"/>
      </a></td>
      <td><xsl:value-of select="JB_name"/></td>
      <td style="text-align: right;"><xsl:value-of select="tasks"/></td>
      <td><a>
         <xsl:attribute name="href"><xsl:value-of select="$qstatqueue-href"/>?<xsl:value-of select="queue_name"/></xsl:attribute>
         <xsl:value-of select="queue_name"/>
      </a></td>
      <td style="text-align: right;"><xsl:value-of select="slots"/></td>
      <td><xsl:value-of select="JAT_start_time"/></td>
      <td><xsl:value-of select="JAT_prio"/></td>
      <td><xsl:value-of select="state"/></td>
    </tr>
    </xsl:for-each>
    </table>
    
    <xsl:if test="not($queue)">
    <h2>Pending Jobs</h2>
    <table>
    <tr>
      <th>jobID</th>
      <th>owner</th>
      <th>name</th>
      <th>tasks</th>
      <th>slots</th>
      <th>submissionTime</th>
      <th>priority</th>
      <th>state</th>
    </tr>
    <xsl:for-each select="job_info/job_info/job_list">
    <tr>
      <td><a>
         <xsl:attribute name="href"><xsl:value-of select="$job-href"/>?<xsl:value-of select="JB_job_number"/></xsl:attribute>
         <xsl:value-of select="JB_job_number"/>
      </a></td>
      <td><a>
         <xsl:attribute name="href">?<xsl:value-of select="JB_owner"/></xsl:attribute>
         <xsl:value-of select="JB_owner"/>
      </a></td>
      <td><xsl:value-of select="JB_name"/></td>
      <td><xsl:value-of select="tasks"/></td>
      <td style="text-align: right;"><xsl:value-of select="slots"/></td>
      <td><xsl:value-of select="JB_submission_time"/></td>
      <td><xsl:value-of select="JAT_prio"/></td>
      <td><xsl:value-of select="state"/></td>
    </tr>
    </xsl:for-each>
    </table>
    </xsl:if>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
