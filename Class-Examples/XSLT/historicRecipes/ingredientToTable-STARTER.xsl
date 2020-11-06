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
                
                <h2><xsl:apply-templates select="descendant::list[@type='ingredients']/label"/></h2>
              <table>
                  <tr><th>ingredID</th>
                      <th>Quantity</th>
                      <th>Unit</th>
                      <th>Type</th>
                      <th>Step(s) used in the recipe</th>
                  </tr>
                  
                  <xsl:apply-templates select="descendant::list[@type='ingredients']/item"/>
                  
              </table> 
                
           <h2>Equipment</h2>
                <ul>
                    
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="list[@type='ingredients']/item">
        <!--The @match is known as the "context node". -->
        <tr>
            <td><xsl:apply-templates select="@xml:id"/></td>
            <td><xsl:apply-templates select="@quant"/></td>
            <td><xsl:apply-templates select="@unit"/></td>
            <td><xsl:apply-templates select="@type"/></td>
            <td><xsl:value-of select="following::list[@type='Instructions']/item[descendant::ingred[substring-after(@ptr, '#') = current()/@xml:id] ]/@type => string-join(', ')"/> </td>
            
            
        </tr>
        
    </xsl:template>
    
    
</xsl:stylesheet>