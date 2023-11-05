<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
<html>
	<head></head>
	<body>
		<h1>Listes des comptes</h1>
		<table border="1">
			<tr>
				<th>Code</th>
				<th>Solde</th>
				<th>Date de Création</th>
			</tr>
			<xsl:for-each select="BanqueService/getComptes">
			<tr>
				<th><xsl:value-of select="code"/></th>
				<th><xsl:value-of select="solde"/></th>
				<th><xsl:value-of select="dateCreation"/></th>
			</tr>
			</xsl:for-each>
		</table>
		<xsl:variable name="totalSolde" select="sum(BanqueService/getComptes/solde)"></xsl:variable>
			<p>Somme totale des soldes : <xsl:value-of select="$totalSolde"/></p>
		<h1>Comptes >2000</h1>
		<table border="1">
			<tr>
				<th>Code</th>
				<th>Solde</th>
				<th>Date de Création</th>
			</tr>
		<xsl:for-each select="BanqueService/getComptes[substring(dateCreation, 1, 4) > 2000]">
				<tr>
					<th><xsl:value-of select="code"/></th>
					<th><xsl:value-of select="solde"/></th>
					<th><xsl:value-of select="dateCreation"/></th>
				</tr>
			</xsl:for-each>			
		</table>
		<xsl:variable name="totalSoldeFiltré" select="sum(BanqueService/getComptes[substring(dateCreation,1,4)>2000]/solde)"></xsl:variable>
			<p>Somme totale des soldes des comptes filtrés : <xsl:value-of select="$totalSoldeFiltré"/></p>
	</body>
</html>
	</xsl:template>
</xsl:stylesheet>