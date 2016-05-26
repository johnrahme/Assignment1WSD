<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<table class="table table-striped table-bordered">
			<tr>
			<th>Title</th>
			<th>Creator</th>
			<th>Location</th>
			<th>Creation Date/Time</th>
			<th>View Details</th>
			</tr>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="poll">
	<xsl:variable name="id">
		<xsl:value-of select="@id"/>
	</xsl:variable>
	<tr>
		<xsl:apply-templates/>
		<td><a href="pollPage.jsp?id={$id}"><button class = "btn btn-primary">View</button></a></td>
	</tr>
	</xsl:template>
	<xsl:template match="poll/title">
		<td><xsl:apply-templates/></td>
	</xsl:template>
	<xsl:template match="poll/creator">
		<td><xsl:apply-templates/></td>
	</xsl:template>
	<xsl:template match="poll/description"/>
	<xsl:template match="poll/location">
		<td><xsl:apply-templates/></td>
	</xsl:template>
	<xsl:template match="poll/createdAt">
		<td><xsl:apply-templates/></td>
	</xsl:template>
	<xsl:template match="poll/createdAt/date">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="poll/createdAt/time">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="poll/open"/>
	<xsl:template match="poll/options"/>
</xsl:stylesheet>
