<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlsn="http://www.w3.org/1999/xhtml" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
    <!--  
        
    Studente: Giulio Canapa
    CdL: InfoUma
    Matricola: 568649

    L'esercizio consiste nell'applicare delle regole di stile alla codifica di una lettera di Bellini (esercizioLetteraA) con un file xsl,
    per poi utilizzare il comando xsltproc. 

    -->
    	<html>
    		<head>
    			<title>LL1.10 - Digital Edition</title>
    			<link href="style.css" rel="stylesheet" type="text/css"/>
    			<script src="script.js"></script>
    		</head>
    		<body>
    			<div id="header">
    				<h1><xsl:value-of select="//tei:titleStmt//tei:title"/></h1>
    			</div>
    			<div id="desc">
    				<h1>Descrizione:</h1>
    				<xsl:apply-templates select="//tei:titleStmt/tei:title"/>
    				<xsl:apply-templates select="//tei:titleStmt/tei:author"/>
    				<xsl:apply-templates select="//tei:correspDesc/tei:correspAction[@type='received']"/>
    				<xsl:apply-templates select="//tei:msDesc"/>
    				<xsl:apply-templates select="//tei:physDesc"/>
    				<xsl:apply-templates select="//tei:sealDesc"/>
    				<b>Note: </b><xsl:value-of select="//tei:msItem/tei:note"/>
    				<xsl:value-of select="//tei:adminInfo"/>
    			</div>
    			<div id="main">
    				<table>
    					<tr>
		    				<td id="image">
			    				<h1>Galleria:</h1>
								<img src="indietro.png"  class="frecce" id="indietro" alt="indietro"/>  
								<img id="foto" alt="foto"/>
								<img src="avanti.png"  class="frecce" id="avanti" alt="avanti"/>	
								<br />
								<input type="button" id="startStop" value="Start"/>
							</td>
							<td id="testo">
								<h1>Testo:</h1>
								<xsl:apply-templates select="//tei:body"/>
			    			</td>
			    		</tr>
			    	</table>
	    		</div>
    			<div id="bibl">
    				<h1>Note testuali:</h1>
    				<b>Seminara, 28 - Mercadante: </b><xsl:value-of select="//tei:person[@xml:id='SM']//tei:p"/><br/><br/>
    				<b>Seminara, 472 - "ballo novo": </b><xsl:value-of select="//tei:item//tei:p"/><br/><br/>
    				<b>Della Seta - "ballo novo", "balletto": </b><xsl:value-of select="//tei:gloss"/><br/><br/>
    				<b>Seminara, 473 - "Sofia": </b><xsl:value-of select="//tei:person[@xml:id='SG']//tei:p"/>
    				<h1>Bibliografia:</h1>
    				<xsl:apply-templates select="//tei:back//tei:listBibl['@xml:id=LL1_10_bibliography']"/>
    			</div>
    			<div id="footer">
    				<p>
    				<xsl:value-of select="//tei:msIdentifier//tei:idno"/> -
    				<xsl:value-of select="//tei:editionStmt//tei:respStmt"/>-
    				<xsl:value-of select="//tei:editionStmt//tei:edition//tei:date"/> -
    				<xsl:value-of select="//tei:publicationStmt//tei:publisher"/> -
    				<xsl:value-of select="//tei:publicationStmt//tei:availability"/><br/>
    			 	<xsl:value-of select="//tei:titleStmt//tei:respStmt"/> -
    			 	<xsl:apply-templates select="//tei:editionStmt//tei:respStmt[@n='2']"/>
    			 	</p>
    			</div>
    		</body>
    	</html>
    </xsl:template>
    <xsl:template match="tei:titleStmt/tei:title">
	    <p>
        <b>Titolo: </b> 
	    <xsl:apply-templates/>
	    </p>
    </xsl:template>
    <xsl:template match="tei:titleStmt/tei:author">
	    <p>
        <b>Autore: </b> 
        <xsl:apply-templates/>
	    </p>
    </xsl:template>
    <xsl:template match="//tei:correspDesc/tei:correspAction[@type='received']">
        <p>
        <b>Destinatario: </b> 
	    <xsl:apply-templates/>
	    </p>
    </xsl:template>
    <xsl:template match="tei:msDesc"> 
	    <p>
	    <b>Ubicazione: </b>
	    <xsl:value-of select="//tei:country"/>,
	    <xsl:value-of select="//tei:settlement"/>,
	    <xsl:value-of select="//tei:repository"/>.
	    <xsl:value-of select="//tei:altIdentifier/tei:idno"/>
	    </p>
	    <p>
	    <b>Lingua: </b>
	 	<xsl:value-of select="//tei:textLang"/>
	    </p>
    </xsl:template>
	<xsl:template match="tei:physDesc"> 
	  	<b>Formato: </b>
	    <xsl:value-of select="//tei:measure"/> folio,
	    <xsl:value-of select="//tei:height"/> x
	    <xsl:value-of select="//tei:width"/> mm
	    <br/>
	    <br/>
	    <b>Descrizione biglietto: </b>
        <xsl:value-of select="//tei:support/tei:p"/>
        <xsl:value-of select="//tei:physDesc//tei:foliation/tei:p"/>
	        <br/>
	        <br/>
	        <b>Scrittura e annotazioni: </b>
	        <xsl:for-each select="//tei:handNote">
	       	<ul>
	       		<li>
	       			<xsl:value-of select="./tei:p"/>
	       		</li>
	       	</ul>
	    </xsl:for-each>
   	</xsl:template>
   	<xsl:template match="tei:sealDesc">
	   	<br/>
	   	<b>Sigilli: </b>
	   	<xsl:for-each select="//tei:seal">
	   		<ul>
	   			<li>
	   				<xsl:value-of select="./tei:p"/>
		   		</li>
		   	</ul>
	   	</xsl:for-each>
    </xsl:template>
	<xsl:template match="tei:lb">
        <xsl:apply-templates/>
        <br/>
        <br/>
    </xsl:template>
    <xsl:template match="tei:expan">
       	[<xsl:apply-templates/>]
    </xsl:template>
    <xsl:template match="tei:reg">
      	[<xsl:apply-templates/>]
	</xsl:template>
    <xsl:template match="tei:hi[@rend='underline']">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    <xsl:template match="tei:hi[@rend='superscript']">
       	<sup><xsl:apply-templates/></sup>
    </xsl:template>
    <xsl:template match="tei:listBibl/tei:bibl">
       	<ul>
       		<li>
  				<xsl:apply-templates/>
       		</li>
       	</ul>
    </xsl:template>
    <xsl:template match="tei:listBibl/tei:head">
   		<b><xsl:apply-templates/></b>
    </xsl:template>
    <xsl:template match="tei:editionStmt//tei:respStmt[@n='2']">
       	<xsl:value-of select="tei:resp"/>
       	<xsl:value-of select="tei:name[@xml:id='AMDG']"/>, 
		<xsl:value-of select="tei:name[@xml:id='EC']"/>, 
		<xsl:value-of select="tei:name[@xml:id='DS']"/>
    </xsl:template>
</xsl:stylesheet>