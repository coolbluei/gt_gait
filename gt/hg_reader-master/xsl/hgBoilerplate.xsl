<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" exclude-result-prefixes="php">
  <xsl:output method="xml" encoding="utf-8" indent="no" omit-xml-declaration="yes"/>
  <xsl:param name="owner" select="'GT Communications and Marketing'"/>

  <xsl:variable name="base_path" select="php:functionString('base_path')" />

  <xsl:template match="/node">
    <div class="fullPanel">
      <h2><xsl:value-of select="title" /></h2>

      <!-- Body Text -->
      <xsl:value-of disable-output-escaping="yes" select="body" />

    </div>
  </xsl:template>
</xsl:stylesheet>
