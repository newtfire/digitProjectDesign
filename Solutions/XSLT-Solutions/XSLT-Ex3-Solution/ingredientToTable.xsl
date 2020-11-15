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
                <title>Ingredients and Equipment from <xsl:apply-templates select="descendant::recipe/@name"/></title>
            <!-- When ready to associate a CSS fie, you'd add your link line here:   
                <link rel="stylesheet" type="text/css" href="yourCSSFileName.css"/>
            -->
            </head>
            <body>
             <!--Remember, the displayed page of your HTML goes inside the <body> element. -->   
                <h1>Ingredients and Equipment from <xsl:apply-templates select="descendant::recipe/@name"/></h1>   
             
             <h2>Ingredients</h2>
          <table>
              <tr><th>Ingredient id</th>
                  <!--  <th>Ingredient Name</th>  
                    The Historic Recipes team could add this column when ready, and pull the information from a separate file! 
                    (We'll show you how to do this in a future assignment.)
                   The project can write XSLT to pull all the distinct values of ingredients and ingredient xml:ids from its recipe file collection and prepare 
                   a single list of all ingredients, with standard names and any related information about them you want to store.
                  -->
                  <th>Type</th>
                  <th>Quantity</th>
                  <th>Unit</th>
                  <th>Step(s) used in recipe</th>
              
              </tr>
              <xsl:apply-templates select="descendant::list[@type='ingredients']/item">
                  <!--<xsl:sort select="@type"/>-->
                  <xsl:sort select="(following::list[@type='Instructions']/item[descendant::ingred[substring-after(@ptr, '#') = ./@xml:id]]/@type)[1]"/>
              </xsl:apply-templates>
          </table>
                
                <h2>Equipment</h2>
                <ul>
                    <xsl:apply-templates select="descendant::list[@type='equip']/item"/>
                </ul>
                
                <h2><xsl:apply-templates select="descendant::list[@type='Instructions']/listName"/></h2>
               <ol><xsl:apply-templates select="descendant::list[@type='Instructions']/item"/></ol>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="list[@type='ingredients']/item">
        <tr>
   <td><xsl:apply-templates select="@xml:id"/></td> 
   <td><xsl:apply-templates select="@type"/></td> 
   <td><xsl:apply-templates select="@quant"/></td> 
   <td><xsl:apply-templates select="@unit"/></td> 
   <td><xsl:value-of select="following::list[@type='Instructions']/item[descendant::ingred[substring-after(@ptr, '#') = current()/@xml:id]]/@type => string-join(', ')"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="list[@type='equip']/item">
        <xsl:variable name="equipmentTokens" select="normalize-space()"/>
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="list[@type='Instructions']/item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="ingred">
       <span class="{//item[@xml:id = current() ! substring-after(@ptr, '#')]/@type}"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>