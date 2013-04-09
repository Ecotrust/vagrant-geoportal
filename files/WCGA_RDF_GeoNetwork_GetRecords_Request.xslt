<?xml version="1.0" encoding="UTF-8"?>
<!--
 See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 Esri Inc. licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="no" encoding="UTF-8" omit-xml-declaration="yes"/>
    <xsl:variable name="keyword" select="/GetRecords/KeyWord"/>
    <xsl:variable name="minX" select="/GetRecords/Envelope/MinX"/>
    <xsl:template match="/">
    
        <xsl:element name="csw:GetRecords" use-attribute-sets="GetRecordsAttributes" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:ogc="http://www.opengis.net/ogc" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:gml="http://www.opengis.net/gml">
            <csw:Query  typeNames="gmd:MD_Metadata">
                <csw:ElementSetName>full</csw:ElementSetName>
                <csw:Constraint version="1.1.0">
                    <ogc:Filter xmlns="http://www.opengis.net/ogc">
<!--
                       <xsl:if test="normalize-space($keyword)!='' or normalize-space($minX) != ''" >
-->
                         <ogc:And>
                            <ogc:Or>
                              <!-- Oregon Coastal Atlas -->
                                <ogc:PropertyIsEqualTo>
                                    <!-- Territorial Sea Polygon -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>14bc2a25-92b9-4214-b915-4e01aec65163</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Bathymetry Contours -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>cabc9d89-bea3-4be9-8a32-e87482ec4324</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- ESI -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>66d741bc-dcea-43a6-b14b-8160c52f3971</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Cables -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>d24d8a50-5cfd-40bb-9fd1-e8c189d23293</ogc:Literal>
                                </ogc:PropertyIsEqualTo>

                              <!-- /Oregon Coastal Atlas -->
                           </ogc:Or> 
                         </ogc:And>
<!--
                       </xsl:if> 
-->
                    </ogc:Filter>
                </csw:Constraint>
            </csw:Query>
        </xsl:element>
    </xsl:template>

    <!-- key word search -->
    <xsl:template match="/GetRecords/KeyWord" xmlns:ogc="http://www.opengis.net/ogc">
        <xsl:if test="normalize-space(.)!=''">
            <ogc:PropertyIsLike wildCard="%" escapeChar="_" singleChar="\">
                <ogc:PropertyName>AnyText</ogc:PropertyName>
                <ogc:Literal>%<xsl:value-of select="."/>%</ogc:Literal>
            </ogc:PropertyIsLike>
        </xsl:if>
    </xsl:template>

    <!-- LiveDataOrMaps search -->
    <xsl:template match="/GetRecords/LiveDataMap" xmlns:ogc="http://www.opengis.net/ogc">
        <xsl:if test=".='True'">
            <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>Format</ogc:PropertyName>
                <ogc:Literal>liveData</ogc:Literal>
            </ogc:PropertyIsEqualTo>
        </xsl:if>
    </xsl:template>

    <!-- envelope search -->
    <xsl:template match="/GetRecords/Envelope" xmlns:ogc="http://www.opengis.net/ogc">
        <!-- generate BBOX query if minx, miny, maxx, maxy are provided -->
        <xsl:if test="./MinX and ./MinY and ./MaxX and ./MaxY">
            <ogc:BBOX xmlns:gml="http://www.opengis.net/gml">
                <ogc:PropertyName>iso:BoundingBox</ogc:PropertyName>
                <gml:Box>
                    <gml:coordinates>
                        <xsl:value-of select="MinX"/>,<xsl:value-of select="MinY"/>,<xsl:value-of select="MaxX"/>,<xsl:value-of select="MaxY"/>
                    </gml:coordinates>
                </gml:Box>
            </ogc:BBOX>
        </xsl:if>
    </xsl:template>

    <!--
    <xsl:attribute-set name="GetRecordsAttributes">
		<xsl:attribute name="version">2.0.1</xsl:attribute>
		<xsl:attribute name="service">CSW</xsl:attribute>
		<xsl:attribute name="resultType">RESULTS</xsl:attribute>
		<xsl:attribute name="startPosition"><xsl:value-of select="/GetRecords/StartPosition"/></xsl:attribute>
		<xsl:attribute name="maxRecords"><xsl:value-of select="/GetRecords/MaxRecords"/></xsl:attribute>
		<xsl:attribute name="outputSchema">csw:Record</xsl:attribute>
	</xsl:attribute-set>
    -->
    <xsl:attribute-set name="GetRecordsAttributes">
		<xsl:attribute name="outputSchema">http://www.isotc211.org/2005/gmd</xsl:attribute>
        <xsl:attribute name="version">2.0.2</xsl:attribute>
        <xsl:attribute name="service">CSW</xsl:attribute>
        <xsl:attribute name="resultType">results</xsl:attribute>
        <xsl:attribute name="startPosition">
            <xsl:value-of select="/GetRecords/StartPosition"/>
        </xsl:attribute>
        <xsl:attribute name="maxRecords">
            <xsl:value-of select="/GetRecords/MaxRecords"/>
        </xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>
