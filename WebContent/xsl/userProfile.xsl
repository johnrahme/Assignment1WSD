<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<table class="table table-striped table-bordered">
			<tr>
			<th>Title</th>
			<th>Location</th>
			<th>Creation Date/Time</th>
			<th>View Details</th>
			<th>View Responses</th>
			<th>Change status</th>
			</tr>
			<xsl:apply-templates/>
		</table>
		
	</xsl:template>
	<xsl:template match="poll">
	<xsl:variable name="id">
		<xsl:value-of select="@id"/>
	</xsl:variable>
	<xsl:variable name="status">
		<xsl:value-of select="open"/>
	</xsl:variable>
		
			
			<tr>
				<xsl:apply-templates/>
				<td><a href="pollPage.jsp?id={$id}"><button class = "btn btn-primary">View</button></a></td>
				<td><a href="pollResponses.jsp?id={$id}"><button class = "btn btn-primary">Responses</button></a></td>
				<td><a href="changeStatus.jsp?id={$id}&amp;status={$status}"><button class = "btn btn-primary">Change</button></a></td>
				
			</tr>
		
	</xsl:template>
	<xsl:template match="poll/title">
		<td><xsl:apply-templates/></td>
	</xsl:template>
	<xsl:template match="poll/creator"/>
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
	<xsl:template match="poll/open">
	</xsl:template>
	<xsl:template match="poll/options"/>
</xsl:stylesheet>
