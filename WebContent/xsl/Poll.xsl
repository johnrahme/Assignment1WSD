<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<form method = "POST" action = "storeParticipant.jsp">
			<xsl:apply-templates/>
			<div class = "form-group">
				<label class = "form-label">Name: </label>
				<input class = "form-control" name = "name" id = "name" type = "text"></input>
			</div>
			<xsl:variable name="id">
				<xsl:value-of select="/*/@id"/>
			</xsl:variable>
			<input type = "hidden" name = "id" value = "{$id}"></input>
			<button type = "submit" class = "btn btn-success">Register</button>
		</form>
	</xsl:template>
	<xsl:template match="title">
		<h2>Information</h2>	
		Title: <xsl:apply-templates/><br></br>
	</xsl:template>
	<xsl:template match="creator">
		Creator: <xsl:apply-templates/><br></br>
	</xsl:template>
	<xsl:template match="description">
		Description: <xsl:apply-templates/><br></br>
	</xsl:template>
	<xsl:template match="location">
		Location: <xsl:apply-templates/><br></br>
	</xsl:template>
	<xsl:template match="createdAt">
		 <xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="createdAt/date">
		Created at date: <xsl:apply-templates/><br></br>
	</xsl:template>
	<xsl:template match="createdAt/time">
		Created at time: <xsl:apply-templates/><br></br>
	</xsl:template>
	<xsl:template match="open"/>
	<xsl:template match="Options">
		<h2>Register</h2>	
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Options/option">
		<xsl:variable name="id">
			<xsl:value-of select="@id"/>
		</xsl:variable>
		<xsl:apply-templates/><input type="checkbox" name="{$id}"></input><br></br>
	</xsl:template>
	<xsl:template match="Options/option/participants"/>
	<xsl:template match="Options/option/time">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Options/option/time/date">
		<xsl:apply-templates/> at 
	</xsl:template>
	<xsl:template match="Options/option/time/time">
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>