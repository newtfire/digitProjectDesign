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
               <title><xsl:apply-templates select="//groupName"/></title>
           </head>
           <body>
               <h1><xsl:apply-templates select="//groupName"/></h1>
               
               <section id="discography">
                   <h2>Discography</h2>
                  <ul><xsl:apply-templates select="//discography"/></ul>
               </section>
               
               <section id="members">
               <h2>Member List</h2>
               <xsl:apply-templates select="//memberList"/>
               </section>
               
           </body>
           
       </html>
   </xsl:template> 
    
    <xsl:template match="album">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="member">
        <img src="{portrait}" alt="portrait of {stageName} or {koreanName}" width="200"/>
       <h3>Names:</h3> 
            <ul>
                <li>Korean Name: <xsl:apply-templates select="koreanName"/></li>
                <li>Stage Name: <xsl:apply-templates select="stageName"/></li>
            </ul>
        <h3>Roles:</h3> 
        <ol><xsl:apply-templates select="role"/></ol>
        <hr/>
    </xsl:template>
    
    <xsl:template match="position">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
      
</xsl:stylesheet>