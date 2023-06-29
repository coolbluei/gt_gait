<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" exclude-result-prefixes="php">
  <xsl:output method="xml" encoding="utf-8" indent="no" omit-xml-declaration="yes"/>
  <xsl:param name="owner" select="'GT Communications and Marketing'"/>

  <xsl:variable name="base_path" select="php:functionString('base_path')" />

  <xsl:template match="/node">
      <h2><xsl:value-of select="title" /></h2>

      <!-- Related Files -->
      <xsl:if test="files/item/fid">
        <div class="hg-sidebar">
          <h3>Related Files</h3>
          <ul id="itemList">
            <xsl:for-each select="files/item">
              <li class="clearfix">
                <p>
                <xsl:variable name="file_name" select="php:functionString('urlencode',filename)" />
                <xsl:variable name="file_mime" select="php:functionString('urlencode',filemime)" />
                <xsl:variable name="file_path" select="php:functionString('urlencode',filepath)" />
                <xsl:choose>
                  <xsl:when test="description != ''">
                    <a href="/hg/file?fname={$file_name}&amp;fmime={$file_mime}&amp;fpath={$file_path}"><xsl:value-of disable-output-escaping="yes" select="description" /></a>
                  </xsl:when>
                  <xsl:otherwise>
                    <a href="/hg/file?fname={$file_name}&amp;fmime={$file_mime}&amp;fpath={$file_path}"><xsl:value-of disable-output-escaping="yes" select="filename" /></a>
                  </xsl:otherwise>
                </xsl:choose>
                <em>
                <xsl:choose>
                  <xsl:when test="filesize &gt; 999999">
                  (<xsl:value-of disable-output-escaping="yes" select="round(filesize div 1000000)" />MB
                  </xsl:when>
                  <xsl:otherwise>
                  (<xsl:value-of disable-output-escaping="yes" select="round(filesize div 1000)" />k
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="filemime != ''">
                  <xsl:value-of disable-output-escaping="yes" select="filemime" />
                </xsl:if>
                )</em>
                </p>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </xsl:if>

      <!-- Body Text -->
      <xsl:value-of disable-output-escaping="yes" select="body" />

      <!-- Related Links -->
      <xsl:if test="links_related/item">
        <div class="relatedLinks">
          <h4>Related Links</h4>
          <ul>
            <xsl:for-each select="links_related/item">
              <li>
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="url" />
                  </xsl:attribute>
                  <xsl:value-of disable-output-escaping="yes" select="link_title" />
                </a>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </xsl:if>
        
      <!-- Boilerplate -->
      <xsl:if test="field_boilerplate/item/nid/node">
        <div class="boilerplate">
          <xsl:value-of disable-output-escaping="yes" select="field_boilerplate/item/nid/node/body" />
        </div>
      </xsl:if>
      <hr />
  </xsl:template>
</xsl:stylesheet>
