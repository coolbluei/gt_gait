<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" exclude-result-prefixes="php">
  <xsl:output method="xml" encoding="utf-8" indent="no" omit-xml-declaration="yes"/>
  <xsl:param name="owner" select="'GT Communications and Marketing'"/>
  
  <xsl:param name="teaser" />
  <xsl:param name="count" />
  
  <xsl:template match="/nodes">
      <xsl:for-each select="node">
        <xsl:sort select="start" />
        <xsl:if test="position() &lt;= $count">
          <li class="clearfix">
            <div class="eventDateIcon">
              <span class="eventDateIconMonth">
                <xsl:value-of select="php:functionString('hg_reader_XSLDateTimeXfer','monthStringShort',start)" />
              </span> 
              <span class="eventDateIconDate">
                <xsl:value-of select="php:functionString('hg_reader_XSLDateTimeXfer','dayDigitShort',start)" />
              </span>
            </div>
            <h3><a href="/hg/event/{@id}"><xsl:value-of disable-output-escaping="yes" select="title" /></a></h3>
            <xsl:if test="$teaser = 'summary'">
              <xsl:if test="summary != ''">
                <xsl:value-of disable-output-escaping="yes" select="summary" />
              </xsl:if>
            </xsl:if>
          </li>
        </xsl:if>
      </xsl:for-each>
      <xsl:if test="count(/nodes/node) &gt;= $count">
        <li><a href="/events/"><em>More Events &gt;</em></a></li>
      </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>