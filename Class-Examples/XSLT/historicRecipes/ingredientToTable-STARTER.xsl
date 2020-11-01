<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math xd"
    version="3.0">
 <!--   <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Nov 1, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> eeb4</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>-->
<xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>   
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Ingredients Table from <xsl:apply-templates select="descendant::recipe/@name"/></title>
            <!-- When ready to associate a CSS fie, you'd add your link line here:   
                <link rel="stylesheet" type="text/css" href="yourCSSFileName.css"/>
            -->
            </head>
            <body>
             <!--Remember, the displayed page of your HTML goes inside the <body> element. -->   
                <h1>Ingredients Table from <xsl:apply-templates select="descendant::recipe/@name"/></h1>   
                
                
                
            </body>
            
            
        </html>
    </xsl:template>
</xsl:stylesheet>