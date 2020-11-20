<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="kpopGroupColl" select="collection('kpop-groups/?select=*.xml')"/> 
    <xsl:variable name="X-Spacer" select="50"/>
    <xsl:variable name="Y-Stretcher" select="-10"/>
    <xsl:variable name="barWidth" select="30"/>
    <xsl:variable name="maxAlbumCount" select="$kpopGroupColl//discography/count(album) => max()"/>
   
    <!--2020-11-19 ebb: See SVG color names at https://www.december.com/html/spec/colorsvg.html  -->  
    <!--ebb: Album types are coded as 'mini' | 'full' | 'live' | 'repackage' | 'single' | 'extended' -->    
    
 <xsl:template match="/">
     <svg>
         <g transform="translate(80, 500)">
            <!--X axis --> 
         <line x1="0" y1="0" x2="{10 * $X-Spacer}" y2="0" stroke="indigo"/>
            <!--Y axis -->
          <line x1="0" y1="0" x2="0" y2="{$maxAlbumCount * $Y-Stretcher}" stroke="indigo"/>
 
       
  <!--STACKED BAR PLOT -->           
   
      <xsl:for-each select="$kpopGroupColl//discography">
         <!--WE CAN SET AN <xsl:sort> here: sort on count of albums or anything you like from the source collection. -->
          
          <g class="popBand">
              
              
           
          </g>
      </xsl:for-each>           
         </g> 
     </svg>
 </xsl:template>   
   
    
 
</xsl:stylesheet>
    
