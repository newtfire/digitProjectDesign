<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/> 
    
    <xsl:variable name="Xinterval" select="100"/>
    <xsl:variable name="Ystretcher" select="-10"/>
   
   <xsl:template match="/">
       <svg>
        <g transform="translate(50, 800)">  
            
            <!--X axis --> 
            <line x1="0" y1="0" x2="{13 * $Xinterval}" y2="0" stroke="indigo"/>
            <!--Y axis -->
            <line x1="0" y1="0" x2="0" y2="{70 * -10}" stroke="indigo"/>
            <!--I'm guesstimating the height of my y axis based on the largest count of Alice's speeches in a chapter, returned when I ran this XPath over the source XML:
            //chapter/count(descendant::q[@sp='alice'])
            -->
           
           
        </g>
       </svg>
   </xsl:template>
    
    
</xsl:stylesheet>