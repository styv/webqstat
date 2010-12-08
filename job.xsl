<?xml version="1.0" encoding="UTF-8"?>

<!-- job.xsl - job detail xsl stylesheet
   (c) 2010 steffen@earthlingsoft.net
-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="utf-8"/>

<xsl:include href="common.xsl"/>

<xsl:template match="/">
  <html>
  <head>
    <title>Details for Job <xsl:value-of select="detailed_job_info/djob_info/element/JB_job_number"/></title>
    <link type="text/css" rel="Stylesheet" media="screen" href="webqstat.css" />
  </head>
  <body>
    <h1>Details for Job <xsl:value-of select="detailed_job_info/djob_info/element/JB_job_number"/></h1>
    <p>
    <xsl:copy-of select="$webqstat-navigation"/>
    </p>
    <xsl:for-each select="detailed_job_info/djob_info/element">
    <table>
      <tr><th>job number</th><td><xsl:value-of select="JB_job_number"/></td></tr>
      <tr><th>job name</th><td><xsl:value-of select="JB_job_name"/></td></tr>
      <tr><th>owner</th><td><xsl:value-of select="JB_owner"/> (UID: <xsl:value-of select="JB_uid"/>)</td></tr>
      <tr><th>group</th><td><xsl:value-of select="JB_group"/> (GID: <xsl:value-of select="JB_gid"/>)</td></tr>
      <tr><th>mail list</th><td>
         <xsl:for-each select="JB_mail_list/mail_list">
         <xsl:value-of select="MR_user"/>@<xsl:value-of select="MR_host"/><br />
         </xsl:for-each>
         <xsl:for-each select="JB_mail_list/element">
         <xsl:value-of select="MR_user"/>@<xsl:value-of select="MR_host"/><br />
         </xsl:for-each>
      </td></tr>
      <tr><th>script file</th><td><xsl:value-of select="JB_script_file"/></td></tr>
      <tr><th>job args</th>
         <td>
         <xsl:for-each select="JB_job_args/element">
         <xsl:value-of select="ST_name"/><br />
         </xsl:for-each>
         </td>
      </tr>
      <tr><th>job-array tasks</th><td>
         min: <xsl:value-of select="JB_ja_structure/task_id_range/RN_min"/><br />
         max: <xsl:value-of select="JB_ja_structure/task_id_range/RN_max"/><br />
         step: <xsl:value-of select="JB_ja_structure/task_id_range/RN_step"/>
      </td></tr>
      <tr><th>cwd</th><td><xsl:value-of select="JB_cwd"/></td></tr>
      <tr><th>project</th><td><xsl:value-of select="JB_project"/></td></tr>
      <tr><th>hard queue list</th><td>
         <xsl:for-each select="JB_hard_queue_list/destin_ident_list">
         <xsl:value-of select="QR_name"/><br />
         </xsl:for-each>
      </td></tr>
      <tr><th>hard resource list</th><td>
         <xsl:for-each select="JB_hard_resource_list/qstat_l_requests">
         <xsl:value-of select="CE_name"/>=<xsl:value-of select="CE_stringval"/><br />
         </xsl:for-each>
         <xsl:for-each select="JB_hard_resource_list/element">
         <xsl:value-of select="CE_name"/>=<xsl:value-of select="CE_stringval"/><br />
         </xsl:for-each>
      </td></tr>
      <tr><th>soft resource list</th><td>
         <xsl:for-each select="JB_soft_resource_list/qstat_l_requests">
         <xsl:value-of select="CE_name"/>=<xsl:value-of select="CE_stringval"/><br />
         </xsl:for-each>
         <xsl:for-each select="JB_soft_resource_list/element">
         <xsl:value-of select="CE_name"/>=<xsl:value-of select="CE_stringval"/><br />
         </xsl:for-each>
      </td></tr>
      <tr><th>requested dependencies</th><td>
         <xsl:for-each select="JB_jid_request_list/element">
         <xsl:choose>
            <xsl:when test="JRE_job_number = 0">
            <xsl:value-of select="JRE_job_name"/>
            </xsl:when>
            <xsl:otherwise>
            <xsl:value-of select="JRE_job_number"/>
            </xsl:otherwise>
         </xsl:choose>
         </xsl:for-each>
      </td></tr>
      <tr><th>predecessor list</th><td>
         <xsl:for-each select="JB_jid_predecessor_list/job_predecessors">
         <a><xsl:attribute name="href">?<xsl:value-of select="JRE_job_number"/></xsl:attribute><xsl:value-of select="JRE_job_number"/></a><br />
         </xsl:for-each>
      </td></tr>
      <tr><th>successor list</th><td>
         <xsl:for-each select="JB_jid_successor_list/ulong_sublist">
         <a><xsl:attribute name="href">?<xsl:value-of select="JRE_job_number"/></xsl:attribute><xsl:value-of select="JRE_job_number"/></a><br />
         </xsl:for-each>
      </td></tr>
      <tr><th>parallel environment</th><td><xsl:value-of select="JB_pe"/></td></tr>
      <xsl:for-each select="JB_pe_range/ranges">
      <tr>
         <th>parallel environment range</th>
         <td>
            min: <xsl:value-of select="RN_min"/><br />
            max: <xsl:value-of select="RN_max"/><br />
            step: <xsl:value-of select="RN_step"/>
         </td>
      </tr>
      </xsl:for-each>
      <xsl:for-each select="JB_ja_tasks/ulong_sublist">
      <tr>
         <th>scaled usage list<br />task number <xsl:value-of select="JAT_task_number"/></th>
         <td>
            <xsl:for-each select="JAT_scaled_usage_list/scaled">
            <xsl:value-of select="UA_name"/>: <xsl:value-of select="format-number(UA_value, '#,##0.00')"/>
            <xsl:if test="UA_name = 'cpu'"> s = <xsl:value-of select="format-number(UA_value div 3600, '0.00')"/> h = <xsl:value-of select="format-number(UA_value div 86400, '0.00')"/> days</xsl:if>
            <xsl:if test="UA_name = 'io'"> GB</xsl:if>
            <xsl:if test="UA_name = 'mem'"> GBs</xsl:if>
            <xsl:if test="contains(UA_name, 'vmem')"> B = <xsl:value-of select="format-number(UA_value div 1024 div 1024 div 1024, '0.000')"/> GB</xsl:if>
            <br />
            </xsl:for-each>
            <xsl:for-each select="JAT_message_list/ulong_sublist">
            error reason: <xsl:value-of select="QIM_message"/>
            </xsl:for-each>
         </td>
      </tr>
      </xsl:for-each>
    </table>
    </xsl:for-each>
    
    <table>
    <tr><th>message list</th></tr>
    <xsl:for-each select="detailed_job_info/messages/element/SME_message_list/element">
    <tr>
      <td><xsl:value-of select="MES_message"/></td>
    </tr>
    </xsl:for-each>
    </table>
    
    <table>
    <tr><th>global message list</th></tr>
    <xsl:for-each select="detailed_job_info/messages/element/SME_global_message_list/element">
    <tr>
      <td><xsl:value-of select="MES_message"/></td>
    </tr>
    </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>