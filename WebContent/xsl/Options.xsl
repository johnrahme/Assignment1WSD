<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<table class="table table-striped table-bordered">
		
	    <tr>
	    	<th>Name</th>
	   	  <xsl:for-each select="/*/option/timeslot">
	   	  
	      <th><xsl:value-of select="date"/> at <xsl:value-of select="time"/></th>
	      </xsl:for-each>
	    </tr>
	    <tr>
	    	<td>
		    <xsl:for-each select="/*/option[1]/participants/participant">
		   		<xsl:value-of select="name"/><br></br>
		    </xsl:for-each>
		    </td>
		    <xsl:for-each select="/*/option">
		    <td>
		    <xsl:for-each select="participants/participant">
		    	<xsl:if test="available='true'">
		    		<span class="glyphicon glyphicon-ok" aria-hidden="true" style = "font-size: 20px"></span><br></br>
		    	</xsl:if>
		    	<xsl:if test="available='false'">
		    		<span class="glyphicon glyphicon-remove" aria-hidden="true" style = "font-size: 20px"></span><br></br>
		    	</xsl:if>
		    </xsl:for-each>
		    </td>
		    </xsl:for-each>
		</tr>
		<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="option">
	</xsl:template>
	<xsl:template match="option/id"/>
	<xsl:template match="option/timeslot">
	</xsl:template>
	<xsl:template match="option/timeslot/date">
	</xsl:template>
	<xsl:template match="option/timeslot/time">
	</xsl:template>
	<xsl:template match="option/participants">
	</xsl:template>
	<xsl:template match="option/participants/participant">
	</xsl:template>
	<xsl:template match="option/participants/participant/name">
	</xsl:template>
	<xsl:template match="option/participants/participant/available"/>
</xsl:stylesheet>