<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" exclude-result-prefixes="php">
  <xsl:output method="xml" encoding="utf-8" indent="no" omit-xml-declaration="yes"/>
  <xsl:param name="owner" select="'GT Communications and Marketing'"/>
    
  <xsl:param name="teaser" />
  <xsl:param name="count" />
  
  <xsl:template match="/nodes">
      <xsl:for-each select="node">
        <xsl:if test="position() &lt;= $count">
          <li class="clearfix">
          <xsl:if test="media/item != ''">
            <a href="/hg/news/{@id}">
              <img src="/inc/hgImage.php?nid={media/item}&amp;f=thumbnail_scaled" alt="{title}" />
            </a>
          </xsl:if>
          <h3><a href="/hg/news/{@id}"><xsl:value-of disable-output-escaping="yes" select="title" /></a></h3>
          <xsl:if test="$teaser = 'sentence'">
            <p><xsl:value-of disable-output-escaping="yes" select="sentence" /></p>
          </xsl:if>
          <xsl:if test="$teaser = 'summary'">
            <xsl:value-of disable-output-escaping="yes" select="summary" />
          </xsl:if>
          </li>
        </xsl:if>
      </xsl:for-each>
      <xsl:if test="count(/nodes/node) &gt;= $count">
        <li><a href="/news/"><em>More News &gt;</em></a></li>
      </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>