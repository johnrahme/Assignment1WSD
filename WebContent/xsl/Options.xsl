<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="option">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="option/id"/>
	<xsl:template match="option/timeslot">
		<h4><xsl:apply-templates/></h4>
	</xsl:template>
	<xsl:template match="option/timeslot/date">
		<xsl:apply-templates/> at 
	</xsl:template>
	<xsl:template match="option/timeslot/time">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="option/participants">
		<ul><xsl:apply-templates/></ul>
	</xsl:template>
	<xsl:template match="option/participants/participant">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="option/participants/participant/name">
		<li><xsl:apply-templates/></li>
	</xsl:template>
	<xsl:template match="option/participants/participant/available"/>
</xsl:stylesheet>