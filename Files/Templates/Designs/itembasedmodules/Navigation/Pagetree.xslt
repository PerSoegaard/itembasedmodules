<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="xml" omit-xml-declaration="yes" indent="yes"  encoding="utf-8" />
	<xsl:param name="html-content-type" />

	<xsl:variable name="sitemap" select="/NavigationTree/Settings/LayoutNavigationSettings/@sitemap = 'true'"/>

	<xsl:variable name="rootPageID">
		<xsl:choose>
			<xsl:when test="$sitemap">
				<xsl:value-of select="//Page[1]/@ID"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="/NavigationTree/Settings/GlobalTags/Global.Page.ID"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template match="/NavigationTree">
		<xsl:choose>
			<xsl:when test="$sitemap">
				<xsl:if test="Page">
				<ul class="pagetree">
					<xsl:apply-templates select="Page"/>
				</ul>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- Render pagetree rooted at this page -->
				<xsl:if test=".//Page[@ID=$rootPageID]/Page">
					<ul class="pagetree">
						<xsl:apply-templates select=".//Page[@ID=$rootPageID]/Page"/>
					</ul>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="Page">
		<li>
			<xsl:variable name="class">
				<xsl:if test="@InPath='True'"> active </xsl:if>
				<xsl:if test="@Active='True'"> current </xsl:if>
				<xsl:if test="@ItemType"> <xsl:value-of select="@ItemType"/> </xsl:if>
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
	</xsl:template>
</xsl:stylesheet>
