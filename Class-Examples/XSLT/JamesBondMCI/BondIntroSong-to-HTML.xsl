<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math xd"
    version="3.0">
   <!-- <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 30, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> eeb4</xd:p>
            <xd:p>XSLT to create an HTML page listing band members for KPop Group Profile pages</xd:p>
        </xd:desc>
    </xd:doc>-->
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.')"/></title>
            </head>
            <body>
                <h1><xsl:value-of select="base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.') ! replace(., '[A-Z]', ' $0') ! normalize-space()"/></h1>
                
               <xsl:apply-templates/> 
                
            </body>
        </html>    
    </xsl:template>
    
    <xsl:template match="Verse">
        <div id="V-{count(preceding-sibling::Verse) + 1}">
            <xsl:apply-templates/>
        </div>   
    </xsl:template>
    
   <xsl:template match="lb">
       <br/><span class="lineNumber"><xsl:value-of select="count(preceding::lb) + 1"/></span>
   </xsl:template><!-- You'd use the preceding-sibling:: if you want line numbers only inside stanzas and to restart the count at the next stanza.-->
    
    <xsl:template match="POV">
        <span class="{name()}-{@V}"> 
        <xsl:apply-templates/>
        </span>
    </xsl:template>
  
      
</xsl:stylesheet>