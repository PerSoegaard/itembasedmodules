<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="xml" omit-xml-declaration="yes" indent="yes"  encoding="utf-8" />

	<xsl:variable name="class" select="/NavigationTree/Settings/LayoutNavigationAttributes/@class"/>
	<xsl:variable name="itemType" select="/NavigationTree/Settings/LayoutNavigationSettings/@itemType"/>

	<xsl:template match="/NavigationTree">
		<xsl:if test="//Page[@ItemType = $itemType]">
			<ul>
				<xsl:if test="$class">
					<xsl:attribute name="class">
						<xsl:value-of select="$class"/>
					</xsl:attribute>
				</xsl:if>

				<xsl:apply-templates select="Page"/>
			</ul>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Page">
		<xsl:choose>
			<xsl:when test="@ItemType = $itemType">
				<li>
					<xsl:variable name="class">
						<xsl:if test="@InPath = 'True'"> active </xsl:if>
						<xsl:if test="@Active = 'True'"> current </xsl:if>
						<xsl:if test="@ItemType"> item <xsl:value-of select="@ItemType"/> </xsl:if>
					</xsl:variable>
					<xsl:if test="normalize-space($class)">
						<xsl:attribute name="class">
							<xsl:value-of select="normalize-space($class)"/>
						</xsl:attribute>
					</xsl:if>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="@FriendlyHref" disable-output-escaping="yes" />
						</xsl:attribute>
						<xsl:value-of select="@MenuText" disable-output-escaping="yes" />
					</a>
					<xsl:if test="Page">
						<ul>
							<xsl:apply-templates select="Page"/>
						</ul>
					</xsl:if>
				</li>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
