<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" exclude-result-prefixes="php">
  <xsl:output method="text" encoding="utf-8" indent="no"/>
  <xsl:param name="owner" select="'GT Communications and Marketing'"/>
  
  <!-- Feed is returned in serialized format -->
  <xsl:template match="/nodes">
  <xsl:variable name="total" select="count(/nodes/node)"/>
  
    <xsl:text>a:</xsl:text>
    <xsl:value-of select="$total"/>
    <xsl:text>:{</xsl:text>
    
    <xsl:for-each select="node">
      <xsl:text>i:</xsl:text>
      <xsl:value-of select="@id"/>
      <xsl:text>;</xsl:text>
      
      <xsl:text>a:4:{</xsl:text>
      
      <xsl:text>s:5:"title";</xsl:text>
      <xsl:text>s:</xsl:text>
      <xsl:value-of select="string-length(php:functionString('base64_encode',title))"/>
      <xsl:text>:"</xsl:text>
      <xsl:value-of select="php:functionString('base64_encode',title)"/>
      <xsl:text>";</xsl:text>
      
      <xsl:text>s:7:"summary";</xsl:text>
      <xsl:text>s:</xsl:text>
      <xsl:value-of select="string-length(php:functionString('base64_encode',summary))"/>
      <xsl:text>:"</xsl:text>
      <xsl:value-of select="php:functionString('base64_encode',summary)"/>
      <xsl:text>";</xsl:text>    
  
      <xsl:text>s:8:"dateline";</xsl:text>
      <xsl:text>s:</xsl:text>
      <xsl:value-of select="string-length(php:functionString('base64_encode',dateline))"/>
      <xsl:text>:"</xsl:text>
      <xsl:value-of select="php:functionString('base64_encode',dateline)"/>
      <xsl:text>";</xsl:text>
  
      <xsl:text>s:6:"author";</xsl:text>
      <xsl:text>s:</xsl:text>
      <xsl:value-of select="string-length(php:functionString('base64_encode',author))"/>
      <xsl:text>:"</xsl:text>
      <xsl:value-of select="php:functionString('base64_encode',author)"/>
      <xsl:text>";</xsl:text>
      
      <xsl:text>}</xsl:text>
    </xsl:for-each>
  <xsl:text>}</xsl:text>
  
  </xsl:template>
</xsl:stylesheet>
