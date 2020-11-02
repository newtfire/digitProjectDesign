<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
<!--    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 27, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> eeb4</xd:p>
            <xd:p>XSLT Identity Transformation for the Fall 2020 Elder Scrolls project's 
                Morrowind Book files</xd:p>
        </xd:desc>
    </xd:doc>-->
    
    <xsl:mode on-no-match="shallow-copy"/>
   
    <-- Jeremy.F: Is it correct to just make all xmlid attributes into ref attributes instead of making two changes to the document's 'location' and 'who' elements?
    So then you could go down to  <xsl:template match="location[@xmlid]"> And make it  <xsl:template match="location[@ref]"> instead? -->
    
    <xsl:template match="who[@xmlid]">
        <who ref="#{tokenize(@xmlid, '\s+')[1]}">
        <xsl:apply-templates/>
       </who>
    </xsl:template>
    
    <xsl:template match="location[@xmlid]">
        <location ref="#{replace(@xmlid, '\s+', '-')}" visitable="{@visitable}">
            <xsl:apply-templates/>
        </location> 
    </xsl:template>
    
    <xsl:template match="NPC[@who]">
        <NPC><xsl:apply-templates/></NPC>
    </xsl:template>
    
</xsl:stylesheet>
