<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    
    <xsl:template match="/">
        <html>
            <head>
                <title>skyrim</title>
                <link rel="stylesheet" type="text/css" href="skyrim.css"/>
            </head>
          <body> 
              <xsl:comment>#include virtual="menu.html" </xsl:comment>
              
              <xsl:apply-templates/>
          </body> 
            
        </html> 
    </xsl:template>
    <xsl:template match="paragraph">
        <p><xsl:apply-templates/></p>
        
    </xsl:template>
    
    
    <xsl:template match="body//faction">
       <span><xsl:apply-templates/></span>
    </xsl:template>
    
    
   <xsl:template match="location">
       
       <strong><xsl:apply-templates/></strong>
   </xsl:template> 
   
</xsl:stylesheet>