<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
       <html>
           <head>
               <title><xsl:apply-templates select="descendant::groupName"/></title>
               <!--Add CSS link line to associate a CSS file. -->
           </head>
           <body>
               
               <h1>Group Profile of <xsl:apply-templates select="descendant::groupName"/></h1>       
               
               <h2>Discography</h2>
               <ul>
                   <xsl:apply-templates select="descendant::discography"/>                  
               </ul>
               
               <h2>Members</h2>
               <xsl:apply-templates select="descendant::memberList"/>
              
           </body>
       </html>
    </xsl:template>
   
    <xsl:template match="album">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="member">
       
    </xsl:template>
    
    
</xsl:stylesheet>