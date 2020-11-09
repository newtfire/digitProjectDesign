<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:variable name="dickinsonColl" select="collection('Dickinson/?select=*.xml')"/>
    <!--ebb: The XPath collection() function is designed to take a file path as an argument, to reach into a directory of of multiple XML files.
        When we process an XSLT collection, we need to work with XSLT in a way that tells it how to find the file directory to process.
        
        Above is an XSLT variable that refers to a collection of files: the Dickinson folder, holding the Dickinson files.
        It's a relative file association, so you want to save this folder in the same file directory with this XSLT file, like this:
        
     [XSLT-5-Hmwk-Folder]  
           This-XSLT-File.xsl
           [Dickinson]
        
       The ?select=*.xml part is indicating that ONLY files with a .xml extension in the Dickinson folder are to be part of this collection." -->
    
    <xsl:template match="/">
        <!--We are basically matching on a "dummy" XSLT file in oXygen: select any file inside the Dickinson folder in oXygen as your source for processing.
        But we have to invoke our variable, $dickinsonColl to get this stylesheet to process file-by-file.
        -->
        
        
    </xsl:template>
    
</xsl:stylesheet>
