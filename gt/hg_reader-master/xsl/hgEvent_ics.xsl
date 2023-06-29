<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" media-type="text/calendar" />
<xsl:include href="hgDateFormat.xsl" />

<xsl:template match="/node">

<xsl:text>BEGIN:VCALENDAR</xsl:text>
<xsl:text>&#x0D;&#x0A;VERSION:1.0</xsl:text>
<xsl:text>&#x0D;&#x0A;BEGIN:VEVENT</xsl:text>
<xsl:text>&#x0D;&#x0A;SUMMARY:</xsl:text><xsl:value-of select="title" />
<xsl:text>&#x0D;&#x0A;DESCRIPTION;ENCODING=QUOTED-PRINTABLE:</xsl:text><xsl:value-of select="field_summary" />
<xsl:text>&#x0D;&#x0A;DTSTART:</xsl:text>
<xsl:call-template name="FormatICS">
  <xsl:with-param name="DateTime" select="field_time/item/value" />
</xsl:call-template>
<xsl:text>&#x0D;&#x0A;DTEND:</xsl:text>
<xsl:call-template name="FormatICS">
  <xsl:with-param name="DateTime" select="field_time/item/value2" />
</xsl:call-template>
<xsl:text>&#x0D;&#x0A;END:VEVENT</xsl:text>
<xsl:text>&#x0D;&#x0A;END:VCALENDAR</xsl:text>
</xsl:template>
</xsl:stylesheet>