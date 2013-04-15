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
                    <ogc:PropertyIsEqualTo>
                      <!-- Maritime Boundaries -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{89FFA1F0-F16E-44CD-8F49-E0EA8C3E3D00}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- County Boundaries -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{CB5299D6-5AE4-485A-97BD-78C22AE0473B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--State and County Boundaries -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{F311F674-92A7-4D2C-8EE6-61A4584CF273}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--Park  Boundaries -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{95B66DB9-AA1B-49A5-96B6-F7229C864EC3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--Water Districts -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B636E807-4673-48C4-9276-D508009DFF5D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--State Boundaries -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{FACFF73B-7534-4E91-8956-772DD097AEFF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--National Parks -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A7FA4A2E-0B78-4FE9-B2A5-8C9FFF6BF85B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--State Parks -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{EDAB87D3-2C73-472D-9714-BFB5D3574100}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--Airports -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{19B20845-CD2B-4799-9CED-DCD9A4E8F212}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--Parks -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{F9F7D92C-A5F1-440F-A1D3-FF80F905C4F7}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--Coastal Zone Boundary -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{66838A18-66BD-4155-BF62-FEBA2BA6F5AF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--Watershed Boundary -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7D3D2134-CAB7-4290-AA52-02168FF6D726}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                     <ogc:PropertyIsEqualTo>
                      <!--Conservation Planning Areas -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C6C1EEF2-48DF-4B0C-927B-E436A21D35AF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                     <ogc:PropertyIsEqualTo>
                      <!-- Marine Ecoregions -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{DBAB105A-F8FE-4240-AB1B-9517C9B993EB}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Marine Ecoregions 2000 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{3FB81A91-2B33-47F2-8822-84FA8929E67D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Shoreline -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A539C5B9-A161-49C5-A284-A2F51126F42E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Littoral Cells -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8B7E304F-51DA-4200-AB8B-081BE1ECA177}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Sediment placement Areas -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A87CB480-F1BB-44B5-A6F1-9BAC39257A7E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Navigation Channels -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{930A5BE1-6CDD-406C-ADCE-5934773F789D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- State Waters -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{41BEB4C0-A174-40E6-B389-D6571FE6386F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Geologic Survey Maps -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{806F0547-22C5-4243-9712-FBEFA2D7AAF6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Bioregions -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{0DE9B557-D8DB-43CE-BA4E-E42651E58F63}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Land Cover -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{1EDBD638-6086-4E73-8FF9-8E08FFD378EA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Average Salinity -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{AB29F44B-33B8-48F4-9CE0-0D092B0309C3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Benthic Habitat - GGNRA -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{780ADAF5-ADB9-4801-97C6-90CCDF2F3384}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Offshore Geology - GGNRA -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{3F16622D-CD70-4085-8C40-DDDC60D7919C}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Marine Ecological Regions -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8FB21EFE-FD0B-4857-BCEB-7E1132868C25}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Ocean Basemap -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{6FD8F3B7-FE91-4F4E-B839-2116DFAE9027}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- World Street Map -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{4AEC4CC2-34D6-41A6-9D49-D7B735252495}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Bird Species of Concern -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8EA3782C-29D0-4743-B10F-01ED4EF21A2A}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Oil Spill Incident Tracking -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9982FBCD-D51C-4A4E-A953-FA7AFC6F4DA7}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Fish Passage Assessment -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{0150C5F2-3C47-4A4D-AB2C-BDAD6F6790F3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- usSEABED Data -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{FE6C8873-7707-451C-B25C-50091B1CE265}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Kelp -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8D1B2DF6-79B0-4D06-9252-A107E9522990}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Eelgrass -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{34C845E0-D059-4479-8818-A520574C87D6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Harbor Seals -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{4FBB0604-D96C-489C-B3E1-B087C07E5E09}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Winter Steelhead Range -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{6B4476F2-4A50-4E9C-9554-02EC91F8FE30}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- CA Non Native Aquatics -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8B2F4A87-CCB5-4EF4-B396-D57A7A5CF404}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Steelhead Critical Habitat -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{358E634D-63AC-44AC-BEAB-1DFDB73A16C1}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Marine Aquaculture -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C49EB03E-A916-4141-A1A5-E90CEFEB0D86}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Offshore Surficial Sediment -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7B82D65C-3A1B-473F-8F33-73C9DF3FB102}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Protected Spawning Areas -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B10020A8-D589-4369-8E3B-287A6DAA99FF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Chinook Abundance -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{F210CCC0-1C67-44EF-A86C-88E775D944DD}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Non Salmonid Abundance -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{393113F3-6D06-4BA6-9ED7-3D09BEC79014}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Steelhead Abundance -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{52EDFDA4-135A-472A-9ED2-CB38674B17D7}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Chinook Abundance 2 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B223B625-FA78-47AB-8133-A397657F6B7D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>                      
                    <ogc:PropertyIsEqualTo>
                      <!-- Shoreline Change -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{05D6CB12-E800-4FD4-A713-FF5635FFDF7D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coho Range -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{6A4A4BC1-56BD-41D2-A9D9-DDD12B9AD4B4}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Steelhead Abundance - Line -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{4E4D52A1-4A4E-47F4-84B9-A552091503BC}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Offshore Substrate-North -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C78BA32B-DC74-4F90-92CA-9C9E2C28EBE6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Chinook Critical Habitat -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A4CD7699-2656-40EA-80E5-7A66E38DDEA1}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Shoreline Change - Central -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{05D6CB12-E800-4FD4-A713-FF5635FFDF7D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Shoreline Change - North -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{F6E30AC7-AEBC-46DF-8C04-2AF4E386B2FF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Shoreline Change - South -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{92C93F12-1C5E-4305-B8BA-39D8715F88E2}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- SF Pinniped Sites -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{5E056CA6-B96E-423C-B2B7-10F451FE0549}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Nautical Charts -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{69FCB76D-7209-4FA4-8F46-0EFB4E9FA7CA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Stream Habitat Reach -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{32830E4D-FA44-44B7-AA72-F899ACCC5315}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Armoring I -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{239AA309-837B-44D2-B811-3F19E4B14416}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Armoring II -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7539524A-2712-4CBE-BD60-B0B89F20AF72}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Ports and Facilities -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A797BEBF-206B-49D7-BFCD-392E3A6BF87E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Conditions -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8A3261A5-FB06-470B-A2C7-1BBEA93F5D19}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Bluff Errosion -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{80744CF1-E44B-4462-A5BA-84F21A9B972C}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Zone Map -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{52947CEF-D7A6-4075-84A7-09EB433484D7}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Zone Boundary -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{66838A18-66BD-4155-BF62-FEBA2BA6F5AF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Structures and barriers -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{087F5A1F-F658-43ED-B5DB-9FB3A8B92CFA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Armoring -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{686DA9E0-1E5E-4B87-B496-461708595F4F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Sand Deposits -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A3A61AAC-7983-41A9-9A28-77A52FDE9E45}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Sediment Sources -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9F5AB023-3180-4959-B078-9F2079B424BE}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Upland Sediment Borrow Sites -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{AFF22EF6-49D8-4867-B6C6-CD80020AB36B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- PWA Sea Level Rise -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{FA1AB0D1-98A5-408E-A430-503B0139DDCA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Armoring 2011 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{0E2C7BC2-7B7E-4820-B9A0-65FE1F60D677}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- National Inventory of Dams -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{693E5646-9A86-43EA-BD51-69C358A230F4}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Wetlands -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7CAE566D-4480-400C-977A-0ED2019DC694}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Sea Level Rise -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{E8AB48A6-2C9E-43F5-B762-17F833318589}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- NOAA Average Salinity -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{E197B909-2279-4083-B239-E4CB15855EE0}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Tsunami Risk CA -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{AC619DE4-2AF0-46DC-8839-D33661697FC0}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Tsunami Innudation Risk -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{6FDD7B75-EA85-4B44-BC71-369C18815D64}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Offshore Substrate types -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{64A4D0D0-926C-47B6-827F-FEC4178C4F9F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- SF Bay Eelgrass -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8206404B-D152-45E6-9874-BDF0A37CA3F5}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Bird Areas of Concern -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{E28F62A6-62BB-4952-98FC-7FD5AA487DB5}</ogc:Literal>
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
                      <!-- Washington Shoreline Arc  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{56004969-19E4-4540-B0AE-E230159FA9D5}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington Coastal Land Cover  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7A127EAD-6907-465B-B19A-AF2700871B51}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                     <ogc:PropertyIsEqualTo>
                      <!-- Washington Estuaries  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{1828B630-EFD5-4A7F-9893-AB7FF5DB6AA6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington Littoral Drift  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{FE0C794A-4B9A-46E8-A352-092DC4CF1515}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington River  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{419786C1-D481-45A8-A66B-F952B1DB6934}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington River  temp (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{789E2C0C-F9F9-4520-875F-30C1C80C89C3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington watershed (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{5C1CD50C-9BE1-49B8-BD9E-7E4213C81E17}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington Anadromous Fish Critical Habitat (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B2820417-B331-4012-8B9D-497D81784743}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington Pacific Herring Holding Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A88967C5-A13D-4B2C-A8DC-6F296C4E5E11}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                       <!-- Washington Pacific Herring Spawning Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C6920E4F-FCF6-4CF9-B759-7492DE0C0CEA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Pacific SandLance Holding  Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{744135E5-3BA1-477C-852A-9CFE2966242F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Pacific SandLance Spawning  Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{CD53B7B1-8233-4C6B-8D00-D419EDED71E9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Rock Sole Spawning  Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{26831785-DDD4-490B-8F18-47EE5C6857D1}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Surf Smelt Spawning  Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{881B2DEE-BD3A-47CE-B33B-3DC639231FA5}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Oyster Beds (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{358C3206-4455-4F2E-A211-60A0F9916957}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Geoduck Locations (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{BED99236-D51D-443A-AFD6-6164D94A896C}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Sea Urchins (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{D5A23478-55D6-4FF8-B074-0374C6B1C648}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Abalone (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9107C899-8BEB-45F0-AFB0-87163BFDFA78}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Marine Mammal Haulouts (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{856F5F1A-3EE4-4D7F-9134-55B03F2AB2F3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington City County Boundaries (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{1A1A2433-D5F6-4DC0-A749-40127719BFB2}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Tribal Reservations (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{2990B35D-7EFF-4B07-A4E8-6867E3E06659}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Park Districts (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{187CE5A6-716C-4912-A7A0-ED0C30B023C0}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Military Zones (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C5CBDA5B-1586-4A38-B4BD-7C4CBEF4D4EB}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Aquaculture Parcels (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{E7A40C02-48D4-4676-9777-CCE2BFC41A1B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Aquaculture Parcels (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8A236ABD-AD5F-482E-96D0-33F58741B029}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                     <ogc:PropertyIsEqualTo>
                    <!-- Washington WDFW Lands (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{6C1A1432-179A-46EE-A296-8319135E9417}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Marine farms (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{F75C75A0-DFFC-4B80-9E0D-D6901D2A8762}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Spill Origins (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{DA51DF18-CB4E-4AB9-9B5B-E389E1148D3E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Dams (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7898CD0A-B435-41BE-8B1E-A8D8FBB60825}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Public Utility Districts (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B8125FE1-5C8F-4F38-AE0D-9AC8CD81C958}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Impervious Structures (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{ADCC280D-8D7E-4985-9F3E-945F91EE8653}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Port Locations (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{85207800-4B2C-4315-AA90-0B1A58D6E51A}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Water Quality Monitoring Locations (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{38B7F747-3AD2-4ACD-B670-EA7F46799349}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Airports (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9A4D3273-1A46-47AB-84A8-900498C4CB90}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Ferry Terminals (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{14B5E343-33DF-4A6A-8346-02A2344740BF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Recreational Activities (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{15E330B1-DDEC-4B44-B26A-2F2ED69506E6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Public Access (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{21C5EA2B-14CE-4617-AAB5-A25DD218DB65}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Public Utility District Names (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B8125FE1-5C8F-4F38-AE0D-9AC8CD81C958}</ogc:Literal>
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

