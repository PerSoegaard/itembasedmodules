<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" encoding="utf-8" />
  <xsl:param name="html-content-type" />

  <xsl:template match="/NavigationTree">
		<xsl:if test="count(//Page[@InPath='True']) &gt; 1">
			<ul class="breadcrumb">
				<xsl:apply-templates select="//Page[@InPath='True']" />
			</ul>
		</xsl:if>
  </xsl:template>

  <xsl:template match="//Page[@InPath='True']">
    <li>
			<xsl:choose>
				<xsl:when test="position() = last()">
					<xsl:value-of select="@MenuText" disable-output-escaping="yes"/>
				</xsl:when>
				<xsl:otherwise>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="@FriendlyHref" disable-output-escaping="yes"/>
						</xsl:attribute>
						<xsl:value-of select="@MenuText" disable-output-escaping="yes"/>
					</a>
					<span class="divider">/</span>
				</xsl:otherwise>
			</xsl:choose>
		</li>
  </xsl:template>
</xsl:stylesheet>
