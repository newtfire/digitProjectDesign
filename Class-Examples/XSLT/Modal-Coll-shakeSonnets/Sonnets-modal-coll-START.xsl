<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
   
    <xsl:output indent="yes" method="xhtml" omit-xml-declaration="yes" doctype-system="about:legacy-compat"/>
    
    <xsl:variable name="sonnetsColl" select="collection('shakeSonnets/?select=*.xml')"/>
    
    <!-- This is our root template establishing the structure of our HTML-output -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Sonnets by Shakespeare</title>
            <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1>ShakespeareaN Sonnets</h1>
                <h2>Contents</h2>
                <ul>
                    <xsl:apply-templates select="$sonnetsColl//sonnet" mode="contents">
                      <xsl:sort select="@number ! number()"/>
                     <!--   <xsl:sort>
                            <xsl:variable name="apos">'</xsl:variable>
                            <xsl:value-of select="translate(line[1], $apos, '')"/>
                        </xsl:sort>-->
                    </xsl:apply-templates>
                    
                </ul>
   
               
                <hr/> <!-- horizontal rule line to separate sections-->
                <h2>Poems</h2>
                <xsl:apply-templates select="$sonnetsColl//sonnet"/>
                    
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="sonnet" mode="contents">
        <li>Sonnet number <xsl:apply-templates select="@number"/>:<br/>
            
            <xsl:apply-templates select="line[1]" mode="contents"/>
        </li> 
    </xsl:template>
    
    <xsl:template match="line" mode="contents">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    
    <xsl:template match="sonnet">
        <h3><xsl:apply-templates select="@number"/></h3>
        <ol>
            <xsl:apply-templates select="line"/> 
        </ol>
    </xsl:template>
    
 <xsl:template match="line">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
  
</xsl:stylesheet>
