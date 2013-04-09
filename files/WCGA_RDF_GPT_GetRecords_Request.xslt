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
   <!--
Globals
-->
 <xsl:param name="searchQueryDoHitsOnly" select="'false'"/>
 <xsl:variable name="numOfPrefetchRecords" select="500"/>
 <xsl:variable name="searchTextWildCardCharacter" select="'*'"/>
 <xsl:variable name="searchTextSingleCharacter" select="'%'"/>
 <xsl:variable name="searchTextEscapeCharacter" select="'\'"/> 
 <xsl:variable name="gmlBoxSrsName" select="'http://www.opengis.net/gml/srs/epsg.xml#4326'"/>
  <!--  **********************************************************************************************************************************************************
Template default 

****************************************************************************************************************************************************************-->
  <xsl:template match="/">
    <xsl:choose>
         
      <xsl:when test="count(/GetRecords) > 0">
       <!-- ******************************************************************************************************
       When the minimal xml criteria is given then this section is executed.  This will be given by the harvestor 
       Controlled by [Profiles.xml]/CSWProfiles/Profile/GetRecords/XSLTransformations@expectedGptXmlOutput="MINIMAL_LEGACY_CSWCLIENT"          
       *******************************************************************************************************-->
        <xsl:element name="csw:GetRecords" use-attribute-sets="GetRecordsAttributes" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:ogc="http://www.opengis.net/ogc" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gml="http://www.opengis.net/gml">
          <csw:Query typeNames="csw:Record">
            <csw:ElementSetName>full</csw:ElementSetName>
            <csw:Constraint version="1.0.0">
              <ogc:Filter xmlns="http://www.opengis.net/ogc">
                <ogc:And>
                  <ogc:Or>

		    <!-- CALIFORNIA -->
                    <ogc:PropertyIsEqualTo>
                      <!-- MPAs -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{32647457-C39E-4265-9595-96A2676F1C74}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <!-- /CALIFORNIA -->

                    <!-- Oregon Spatial Data Library -->
                    <ogc:PropertyIsEqualTo>
                      <!-- Oregon Hydrography Water Courses- PNW Hydrography Framework -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{255311EF-9E1E-4E4C-8FF2-FD8EF7B2D527}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Oregon Hydrological Units - 1st - 7th Field -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9DB6F7F2-945D-4FA8-8FAE-04634736C421}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- State Parks -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7454C1CB-51D8-40CA-ABF0-318E4FF5AAB9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Framework/Imagery_Mosaic2009 (WMS) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B797B409-9E0F-4968-816D-2264B6A04DC6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Framework/Imagery_Mosaic2005 (WMS) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{06C5B4F0-F12A-4B8C-8AE6-E7FF04699062}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Framework/Bio_Wetlands (WMS) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{6505FF9E-2ACD-4B16-A933-27829FB2649B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <!-- /Oregon Spatial Data Library -->

                    <!-- Washington Geoportal -->
                    <ogc:PropertyIsEqualTo>
                      <!-- Forest Practices Wetlands -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B19D5945-ED94-4268-B202-A63CFE397982}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Washington Land Cover 2006 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7A3BCA83-00EA-451D-BB2C-9E0521E875D5}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Rivers and Streams of Washington State 1:24,000 - str24 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{419786C1-D481-45A8-A66B-F952B1DB6934}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington State Levee Inventory  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{09317F9A-0156-4B4C-965A-D5836044D083}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>

		    <ogc:PropertyIsEqualTo>
                      <!-- Washington State Levee Inventory  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{00334042-8F29-4B5A-A602-C93B25E1F9A9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>

                    <ogc:PropertyIsEqualTo>
                      <!-- Washington State Levee Inventory  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{1CFE3397-2827-410E-BFD3-91ECA6A30CE6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washimgton Shoreline Arc  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{56004969-19E4-4540-B0AE-E230159FA9D5}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
 

                    <!-- /Washington Geoportal -->
                  </ogc:Or>
                </ogc:And>
              </ogc:Filter>
            </csw:Constraint>
          </csw:Query>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
       <!-- ******************************************************************************************************
       When the full xml criteria is given then this section is executed.  This will be given by the geoportal
       Controlled by [Profiles.xml]/CSWProfiles/Profile/GetRecords/XSLTransformations@expectedGptXmlOutput="FULL_NATIVE_GPTXML"          
       *******************************************************************************************************-->
        <xsl:element name="csw:GetRecords" use-attribute-sets="GetRecordsAttributes" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:ogc="http://www.opengis.net/ogc" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gml="http://www.opengis.net/gml">
          <csw:Query typeNames="csw:Record">
            <csw:ElementSetName>full</csw:ElementSetName>
            <csw:Constraint version="1.0.0">
              <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                <ogc:And>
                  <!-- Time Based Search -->
                  <xsl:call-template name="filterTemporal"/>
                  <!-- Key Word search -->
                  <xsl:call-template name="filterKeyword"/>
                  <!-- Content type search -->
                  <xsl:call-template name="filterContentTypes"/>
                  <!--  type search -->
                  <xsl:call-template name="filterThemeTypes"/>
                  <!-- Envelope search, e.g. ogc:BBOX -->
                  <xsl:call-template name="filterSpatial"/>
                </ogc:And>
              </ogc:Filter>
            </csw:Constraint>
            <xsl:call-template name="filterSort"/>
          </csw:Query>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- key word search -->
  <xsl:template match="/GetRecords/KeyWord" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:if test="normalize-space(.)!=''">
      <ogc:PropertyIsLike wildCard="" escape="" singleChar="">
        <ogc:PropertyName>AnyText</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="."/>
        </ogc:Literal>
      </ogc:PropertyIsLike>
    </xsl:if>
  </xsl:template>
  <!-- LiveDataOrMaps search -->
  <xsl:template match="/GetRecords/LiveDataMap" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:if test="translate(normalize-space(./text()),'true', 'TRUE') ='TRUE'">
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>dc:type</ogc:PropertyName>
        <ogc:Literal>liveData</ogc:Literal>
      </ogc:PropertyIsEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- envelope search -->
  <xsl:template match="/GetRecords/Envelope" xmlns:ogc="http://www.opengis.net/ogc">
    <!-- generate BBOX query if minx, miny, maxx, maxy are provided -->
    <xsl:if test="./MinX and ./MinY and ./MaxX and ./MaxY">
      <ogc:BBOX xmlns:gml="http://www.opengis.net/gml">
        <ogc:PropertyName>Geometry</ogc:PropertyName>
        <gml:Box srsName="http://www.opengis.net/gml/srs/epsg.xml#4326">
          <gml:coordinates>
            <xsl:value-of select="MinX"/>,<xsl:value-of select="MinY"/>,<xsl:value-of select="MaxX"/>,<xsl:value-of select="MaxY"/>
          </gml:coordinates>
        </gml:Box>
      </ogc:BBOX>
    </xsl:if>
  </xsl:template>
  <xsl:template name="tmpltDate" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:if test="string-length(normalize-space(/GetRecords/FromDate/text())) &gt; 0">
      <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="normalize-space(/GetRecords/FromDate/text())"/>
        </ogc:Literal>
      </ogc:PropertyIsGreaterThanOrEqualTo>
    </xsl:if>
    <xsl:if test="string-length(normalize-space(/GetRecords/ToDate/text())) &gt; 0">
      <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="normalize-space(/GetRecords/ToDate/text())"/>
        </ogc:Literal>
      </ogc:PropertyIsLessThanOrEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Utility Templates
 -->
  <!--  *******************************************************************************************************************************************************
Template   Tokenizes
WARNING: needs to be edited if you intend to use the templateName to call your template
@param sentence  The sentence to be tokenized
@param If you leave this out, the word will be printed instead. If you put in a new 
templatename, edit the function to add it in the if statement
@param delimeter Delimeter to be used in the sentence.  Default is space character.
     ************************************************************************************************************************************************************* -->
  <xsl:template name="tokenize">
    <xsl:param name="sentence"/>
    <xsl:param name="templateName"/>
    <xsl:param name="delimeter" select="' '"/>
    <xsl:param name="word"/>
    <xsl:param name="info"/>
    <!--
         If word more than 0 and template then call template otherwise print word -->
    <xsl:choose>
      <xsl:when test="string-length($word) > 0 and string-length(normalize-space($templateName)) > 0">
        <xsl:choose>
          <!-- For this function,important to modify this section if you are using this function so that your template gets called -->
          <xsl:when test="$templateName = 'filterKeywordLikeAnytext'">
            <xsl:call-template name="filterKeywordLikeAnytext">
              <xsl:with-param name="word" select="$word"/>
              <xsl:with-param name="wildcard" select="$info"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName= 'filterThemeType' ">
            <xsl:call-template name="filterThemeType">
              <xsl:with-param name="theme" select="$word"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="string-length($word) > 0">
        <xsl:value-of select="$word"/>
      </xsl:when>
    </xsl:choose>
    <!-- 
        If delimeter detected, curve sentence before and sentence after delimeter. -->
    <xsl:choose>
      <xsl:when test="contains($sentence, $delimeter)">
        <xsl:call-template name="tokenize">
          <xsl:with-param name="word" select="substring-before( $sentence,$delimeter)"/>
          <xsl:with-param name="sentence" select="substring-after( $sentence,$delimeter)"/>
          <xsl:with-param name="templateName" select="$templateName"/>
          <xsl:with-param name="delimeter" select="$delimeter"/>
          <xsl:with-param name="info" select="$info"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="string-length($sentence) > 0">
        <xsl:call-template name="tokenize">
          <xsl:with-param name="word" select="$sentence"/>
          <xsl:with-param name="templateName" select="$templateName"/>
          <xsl:with-param name="info" select="$info"/>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: ContentType 
 -->
  <xsl:template name="filterContentTypes" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootContentType" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterContentTypes']"/>
    <xsl:variable name="contentType" select="normalize-space($rootContentType/param[@name='selectedContentType']/@value)"/>
    <xsl:if test="string-length(normalize-space($contentType)) > 0">
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>Format</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$contentType"/>
        </ogc:Literal>
      </ogc:PropertyIsEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: ThemeType 
 -->
  <xsl:template name="filterThemeType" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:param name="theme"/>
    <xsl:param name="lTheme" select="normalize-space($theme)"/>
    <xsl:if test="string-length($lTheme) > 0">
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>Subject</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$lTheme"/>
        </ogc:Literal>
      </ogc:PropertyIsEqualTo>
    </xsl:if>
  </xsl:template>
  <!--
Entry point for theme types
-->
  <xsl:template name="filterThemeTypes" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootThemeTypes" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterThemeTypes']"/>
    <xsl:variable name="themeTypes" select="$rootThemeTypes/param[@name='theme']/@value"/>
    <xsl:if test="string-length($themeTypes) > 0">
      <ogc:Or>
        <xsl:call-template name="tokenize">
          <xsl:with-param name="sentence" select="$themeTypes"/>
          <xsl:with-param name="templateName" select="'filterThemeType'"/>
          <xsl:with-param name="delimeter" select="'|'"/>
        </xsl:call-template>
      </ogc:Or>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: keyword Filter templates
 -->
  <!-- *******************************************************************************************************************************************************
Template  filterKeywordLikeAnytext
Prints the text to be 
@param word  Word to be searched for
 ************************************************************************************************************************************************************* -->
  <xsl:template name="filterKeywordLikeAnytext" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:param name="word"/>
    <xsl:param name="wildcard"/>
    <xsl:if test="string-length(normalize-space($word)) > 0">
      <ogc:PropertyIsLike>
        <xsl:attribute name="wildCard"><xsl:value-of select="$searchTextWildCardCharacter"/></xsl:attribute>
        <xsl:attribute name="escape"><xsl:value-of select="$searchTextEscapeCharacter"/></xsl:attribute>
        <xsl:attribute name="singleChar"><xsl:value-of select="$searchTextSingleCharacter"/></xsl:attribute>
        <ogc:PropertyName>AnyText</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$wildcard"/>
          <xsl:value-of select="normalize-space($word)"/>
          <xsl:value-of select="$wildcard"/>
        </ogc:Literal>
      </ogc:PropertyIsLike>
    </xsl:if>
  </xsl:template>
  <!-- *******************************************************************************************************************************************************
Template  filterKeyword
@param word  Word to be searched for
 ************************************************************************************************************************************************************* -->
  <xsl:template name="filterKeyword" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootFilterKeyword" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterKeyword']"/>
    <xsl:variable name="keyword" select="normalize-space($rootFilterKeyword/param[@name='SearchText']/@value)"/>
    <xsl:variable name="keywordOperation" select="normalize-space($rootFilterKeyword/param[@name='SearchTextOption']/@value)"/>
    <xsl:choose>
      <xsl:when test="not(contains($keyword, ' ')) or translate($keywordOperation, 'exact', 'EXACT') = 'EXACT'">
        <xsl:call-template name="filterKeywordLikeAnytext">
          <xsl:with-param name="word" select="$keyword"/>
          <!-- xsl:with-param name="wildcard" select="$searchTextWildCardCharacter" -->
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="translate($keywordOperation, 'any', 'ANY') = 'ANY'">
        <ogc:Or>
          <xsl:call-template name="tokenize">
            <xsl:with-param name="sentence" select="$keyword"/>
            <xsl:with-param name="templateName" select="'filterKeywordLikeAnytext'"/>
            <!-- ><xsl:with-param name="info" select="$searchTextWildCardCharacter"/> -->
          </xsl:call-template>
        </ogc:Or>
      </xsl:when>
      <xsl:when test="translate($keywordOperation, 'all', 'ALL') = 'ALL'">
        <ogc:And>
          <xsl:call-template name="tokenize">
            <xsl:with-param name="sentence" select="$keyword"/>
            <xsl:with-param name="templateName" select="'filterKeywordLikeAnytext'"/>
          </xsl:call-template>
        </ogc:And>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- envelope search -->
  <!-- ##########################################################################################################################
Filter: Spatial Filter templates
 -->
  <!-- ***********************************************************************************************************************************************************************************
Template filterSpatial
Outputs the within or interesects of the bounding box
@gptSpatialValues root of spatial nodes
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterSpatial" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="gptSpatialValues" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterSpatial']"/>
    <xsl:if test="$gptSpatialValues/param[@name='selectedBoundOption']/@value = 'useGeogExtent'">
      <ogc:BBOX>
        <xsl:call-template name="filterSpatialBBox">
          <xsl:with-param name="gptSpatialValues" select="$gptSpatialValues"/>
        </xsl:call-template>
      </ogc:BBOX>
    </xsl:if>
    <xsl:if test="$gptSpatialValues/param[@name='selectedBoundOption']/@value = 'dataWithinExtent'">
      <ogc:Within>
        <xsl:call-template name="filterSpatialBBox">
          <xsl:with-param name="gptSpatialValues" select="$gptSpatialValues"/>
        </xsl:call-template>
      </ogc:Within>
    </xsl:if>
  </xsl:template>
  <!-- ***********************************************************************************************************************************************************************************
Template filterSpatialBBox 
Outputs the bounding box
@gptSpatialValues root of spatial nodes
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterSpatialBBox" xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
    <xsl:param name="gptSpatialValues"/>
    <ogc:PropertyName>Geometry</ogc:PropertyName>
    <gml:Box>
      <xsl:attribute name="srsName"><xsl:value-of select="$gmlBoxSrsName"/></xsl:attribute>
      <!-- <gml:coordinates>-180,-90,-100,90</gml:coordinates> -->
      <!--  TODO Test &  get values from xpath -->
      <gml:coordinates>
        <xsl:value-of select="$gptSpatialValues/param[@name='minX']/@value"/>,<xsl:value-of select="$gptSpatialValues/param[@name='minY']/@value"/>,<xsl:value-of select="$gptSpatialValues/param[@name='maxX']/@value"/>,<xsl:value-of select="$gptSpatialValues/param[@name='maxY']/@value"/>
      </gml:coordinates>
    </gml:Box>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: Temporal Filter templates
 -->
  <!-- ***********************************************************************************************************************************************************************************
Template filterTemporal
Outputs CSW time parameters
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterTemporal" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootTemporal" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterTemporal']"/>
    <xsl:variable name="modifiedFrom" select="normalize-space($rootTemporal/param[@name='modifiedDateFrom']/@value)"/>
    <xsl:variable name="modifiedTo" select="normalize-space($rootTemporal/param[@name='modifiedDateTo']/@value)"/>
    <xsl:variable name="temporalOption" select="normalize-space($rootTemporal/param[@name='selectedModifiedTime']/@value)"/>
    <xsl:if test="string-length($modifiedFrom) > 0">
      <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$modifiedFrom"/>
        </ogc:Literal>
      </ogc:PropertyIsGreaterThanOrEqualTo>
    </xsl:if>
    <xsl:if test="string-length($modifiedTo) > 0">
      <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$modifiedTo"/>
        </ogc:Literal>
      </ogc:PropertyIsLessThanOrEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: Sort Filter templates
 -->
  <!-- ***********************************************************************************************************************************************************************************
Template filterTemporal
Outputs CSW sorting parameters
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterSort" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="root" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterSort']"/>
    <xsl:variable name="sortValue" select="normalize-space($root/param[@name='selectedSort']/@value)"/>
    <xsl:if test="string-length($sortValue) > 0">
      <xsl:if test="$sortValue != 'relevance'">
        <ogc:SortBy>
          <ogc:SortProperty>
            <ogc:PropertyName>
              <xsl:choose>
                <xsl:when test="$sortValue = 'areaAscending' or $sortValue = 'areaDescending' ">
                  <xsl:text>envelope</xsl:text>
                </xsl:when>
                <xsl:when test="$sortValue = 'dateAscending' or $sortValue = 'dateDescending' ">
                  <xsl:text>Modified</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$sortValue"/>
                </xsl:otherwise>
              </xsl:choose>
            </ogc:PropertyName>
            <xsl:choose>
              <xsl:when test="$sortValue = 'areaAscending' or $sortValue = 'dateAscending'">
                <ogc:SortOrder>ASC</ogc:SortOrder>
              </xsl:when>
              <xsl:when test="$sortValue = 'areaDescending' or $sortValue = 'dateDescending'">
                <ogc:SortOrder>DESC</ogc:SortOrder>
              </xsl:when>
            </xsl:choose>
          </ogc:SortProperty>
        </ogc:SortBy>
      </xsl:if>
    </xsl:if>
  </xsl:template>
  <xsl:attribute-set name="GetRecordsAttributes">
    <xsl:attribute name="version">2.0.2</xsl:attribute>
    <xsl:attribute name="service">CSW</xsl:attribute>
    <xsl:attribute name="resultType">
      <xsl:choose>
        <xsl:when test="translate($searchQueryDoHitsOnly,'TRUE', 'true')  = 'true' or $searchQueryDoHitsOnly = '1'">HITS</xsl:when>
        <xsl:otherwise>RESULTS</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="startPosition"><xsl:value-of select="/GetRecords/StartPosition"/></xsl:attribute>
    <xsl:attribute name="maxRecords"><xsl:value-of select="/GetRecords/MaxRecords"/></xsl:attribute>
  </xsl:attribute-set>
</xsl:stylesheet>

