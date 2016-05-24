<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	<html>
	 <head>
		<title>Display Polls</title>
	</head>
	<body>
		<table><xsl:apply-templates/></table>
	 </body>
	</html>
	</xsl:template>
	<xsl:template match="poll">
	<tr>
		<th>Title</th>
		<th>Creator</th>
		<th>Location</th>
		<th>Creation Date/Time</th>
		<th>View Details</th>
	</tr>
	<tr>
		<xsl:apply-templates/>
		<td><a href="pollPage.jsp?id=[@id]">View</a></td>
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
	<xsl:template match="poll/Options"/>
</xsl:stylesheet>
