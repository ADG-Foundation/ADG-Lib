<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" omit-xml-declaration="yes" />

<xsl:template match="@* | node()">
  <xsl:copy>
    <xsl:apply-templates select="@* | node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="text()"><xsl:value-of select="translate(., '&#x0d;&#x0a;&#x09;', '')" /></xsl:template> 

<xsl:template match="/">
  <xsl:for-each select="figure">			
% ----------------------------
% Description of construction:
% ----------------------------
  <xsl:apply-templates />
  </xsl:for-each>
</xsl:template>

<!--**************introducing points**************-->

<xsl:template match="define">
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="fixed_point">
  point <xsl:value-of select="."/><xsl:text> </xsl:text>
    <xsl:value-of select="@x"/><xsl:text> </xsl:text> 
    <xsl:value-of select="@y"/><xsl:text> </xsl:text>
</xsl:template>

<!--**************objects**************-->

<xsl:template match="dimensions">
  dim <xsl:value-of select="@width"/><xsl:text> </xsl:text>
    <xsl:value-of select="@height"/><xsl:text> </xsl:text>	
</xsl:template>

<xsl:template match="coefficient">
  <xsl:value-of select="."/>  	
</xsl:template>

<xsl:template match="angle">
  <xsl:value-of select="."/>  	
</xsl:template>

<xsl:template match="point">
  <xsl:value-of select="."/> 
</xsl:template>

<xsl:template match="center">
  <xsl:value-of select="."/>  	
</xsl:template>

<xsl:template match="segment">
  draw<xsl:if test="../@dashed='yes'">dash</xsl:if>segment<xsl:text> </xsl:text> 
  <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
  <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="vector">
  drawvector <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="line_pp">
  draw<xsl:if test="../@dashed='yes'">dash</xsl:if>line<xsl:text> </xsl:text>
  <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
  <xsl:value-of select="point[2]"/><xsl:text> </xsl:text> 
</xsl:template>

<xsl:template match="line">
  draw<xsl:if test="../@dashed='yes'">dash</xsl:if>line<xsl:text> </xsl:text>
  <xsl:value-of select="."/><xsl:text> </xsl:text> 
</xsl:template>

<xsl:template match="circle">
  draw<xsl:if test="../@dashed='yes'">dash</xsl:if>circle<xsl:text> </xsl:text> 
  <xsl:value-of select="."/> 	
</xsl:template>

<xsl:template match="circle_cp">
  draw<xsl:if test="../@dashed='yes'">dash</xsl:if>circle<xsl:text> </xsl:text>
  <xsl:value-of select="center"/><xsl:text> </xsl:text>
  <xsl:value-of select="point"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="arc">
  draw<xsl:if test="../@dashed='yes'">dash</xsl:if>arc <xsl:text> </xsl:text>
  <xsl:value-of select="center"/><xsl:text> </xsl:text>
  <xsl:value-of select="point"/><xsl:text> </xsl:text>
  <xsl:value-of select="angle"/><xsl:text>  </xsl:text>
</xsl:template>


<!--**************constructions**************-->

<xsl:template match="construct">
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates /> 						
</xsl:template>

<xsl:template match="new_point">
  <xsl:text> </xsl:text>
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="intersection">
  intersec <xsl:value-of select="new_point"/>
    <xsl:for-each select="line"><xsl:text> </xsl:text>
      <xsl:value-of select="."/>
    </xsl:for-each>	
</xsl:template>

<xsl:template match="intersection_cc">
  intersec2 <xsl:value-of select="new_point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="new_point[2]"/><xsl:text> </xsl:text>
    <xsl:value-of select="circle[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="circle[2]"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="intersection_cl">
  intersec2 <xsl:value-of select="new_point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="new_point[2]"/><xsl:text> </xsl:text>
    <xsl:value-of select="circle"/><xsl:text> </xsl:text><xsl:value-of select="line"/><xsl:text> </xsl:text>	
</xsl:template>

<xsl:template match="midpoint">
  midpoint <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="foot">
  foot <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="point"/><xsl:text> </xsl:text>
    <xsl:value-of select="line"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="random_point_on_line ">
  online <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>
    		
</xsl:template>

<xsl:template match="translate">
  translate <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="vector/point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="vector/point[2]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="towards">
  towards <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="vector/point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="vector/point[2]"/><xsl:text> </xsl:text>
    <xsl:value-of select="coefficient"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="rotate">
  rotate <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="center"/><xsl:text> </xsl:text>
    <xsl:value-of select="angle"/><xsl:text> </xsl:text>
    <xsl:value-of select="point"/><xsl:text> </xsl:text>	
</xsl:template>

<xsl:template match="half_turn ">
  sim <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="center"/><xsl:text> </xsl:text>
    <xsl:value-of select="point"/><xsl:text> </xsl:text>	
</xsl:template>

<xsl:template match="line_reflection ">
  sim <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="line"/><xsl:text> </xsl:text>
    <xsl:value-of select="point"/><xsl:text> </xsl:text>		
</xsl:template>

<xsl:template match="inversion ">
  sim <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="circle"/><xsl:text> </xsl:text>
    <xsl:value-of select="point"/><xsl:text> </xsl:text>		
</xsl:template>

<xsl:template match="new_line">
  <xsl:value-of select="."/> 	
</xsl:template>

<xsl:template match="ruler ">
  line <xsl:value-of select="new_line"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="parallel ">
  parallel <xsl:value-of select="new_point"/><xsl:text> </xsl:text>
    <xsl:value-of select="point"/><xsl:text> </xsl:text>
    <xsl:value-of select="line"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="perpendicular ">
  perp <xsl:value-of select="new_line"/><xsl:text> </xsl:text>
    <xsl:value-of select="point"/><xsl:text> </xsl:text>
    <xsl:value-of select="line"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="segment_bisector ">
  med <xsl:value-of select="new_line"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="angle_bisector ">
  bis <xsl:value-of select="new_line"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[3]"/><xsl:text>  </xsl:text>		
</xsl:template>

<xsl:template match="new_circle">
  <xsl:value-of select="."/> 	
</xsl:template>

<xsl:template match="compass ">
  circle <xsl:value-of select="new_circle"/><xsl:text> </xsl:text>
    <xsl:value-of select="center"/><xsl:text> </xsl:text>
    <xsl:value-of select="point"/><xsl:text>  </xsl:text>	
</xsl:template>


<!--**************drawing**************-->

<xsl:template match="draw">			
  <xsl:text>&#xa;</xsl:text>    
  <xsl:apply-templates /> 						
</xsl:template>

<xsl:template match="draw[@dashed='no']">			
  <xsl:text>&#xa;</xsl:text>    
  <xsl:apply-templates /> 						
</xsl:template>


<xsl:template match="draw[@dashed='yes']">			
  <xsl:text>&#xa;</xsl:text>    
  <xsl:apply-templates /> 						
</xsl:template>

<xsl:template match="area">
  <xsl:text>area </xsl:text><xsl:value-of select="@x1"/> <xsl:text> </xsl:text>
    <xsl:value-of select="@y1"/> <xsl:text> </xsl:text>
    <xsl:value-of select="@x2"/> <xsl:text> </xsl:text>
    <xsl:value-of select="@y2"/> <xsl:text> </xsl:text>
</xsl:template>

<!--**************labeling**************-->

<xsl:template match="labels">
  <xsl:text>&#xa;</xsl:text>  
  <xsl:apply-templates /> 						
</xsl:template>

<xsl:template match="point_label">
  <xsl:text>&#xa;  </xsl:text>  
<xsl:choose>
<xsl:when test="@direction &gt; 0">
  <xsl:choose>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 22.5">cmark_r </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 67.5">cmark_rt </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 112.5">cmark_t </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 157.5">cmark_lt </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 202.5">cmark_l </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 247.5">cmark_lb </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 292.5">cmark_b </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 337.5">cmark_rb </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 361">cmark_r </xsl:when>
    <xsl:otherwise>cmark </xsl:otherwise>
  </xsl:choose>
</xsl:when>
<xsl:otherwise>
  <xsl:choose>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 22.5">cmark_r </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 67.5">cmark_rt </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 112.5">cmark_t </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 157.5">cmark_lt </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 202.5">cmark_l </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 247.5">cmark_lb </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 292.5">cmark_b </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 337.5">cmark_rb </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 361">cmark_r </xsl:when>
    <xsl:otherwise>cmark </xsl:otherwise></xsl:choose>
  </xsl:otherwise>
</xsl:choose>
<xsl:apply-templates />
</xsl:template>

<xsl:template match="text_label">
  <xsl:text>&#xa;  </xsl:text>  
<xsl:choose>
<xsl:when test="@direction &gt; 0">
  <xsl:choose>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 22.5">printat_r </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 67.5">printat_rt </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 112.5">printat_t </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 157.5">printat_lt </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 202.5">printat_l </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 247.5">printat_lb </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 292.5">printat_b </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 337.5">printat_rb </xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 360">printat_r </xsl:when>
    <xsl:otherwise>printat</xsl:otherwise>
  </xsl:choose>
  </xsl:when>
  <xsl:otherwise>
  <xsl:choose>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 22.5">printat_r</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 67.5">printat_rt </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 112.5">printat_t </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 157.5">printat_lt </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 202.5">printat_l </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 247.5">printat_lb </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 292.5">printat_b </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 337.5">printat_rb </xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 360">printat_r </xsl:when>
    <xsl:otherwise>printat </xsl:otherwise>
  </xsl:choose>
  </xsl:otherwise>
  </xsl:choose>
  <xsl:apply-templates /> 
</xsl:template>

<xsl:template match="text">
  <xsl:text> {</xsl:text>
  <xsl:value-of select="."/> 
  <xsl:text>} </xsl:text>	
</xsl:template>

<!--**************conjectures***********-->

<xsl:template match="conjecture">
  <xsl:text>&#xa;</xsl:text>  
  <xsl:text>&#xa;</xsl:text>  
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="prove">
  prooflevel <xsl:value-of select="@proof_level"/><xsl:text> </xsl:text>
  prooflimit <xsl:value-of select="@proof_limit"/><xsl:text> </xsl:text>  
  prove {<xsl:apply-templates/>}<xsl:text> </xsl:text>  
</xsl:template>

<xsl:template match="equality">equal <xsl:apply-templates/></xsl:template>

<xsl:template match="expression">{ <xsl:apply-templates/> }</xsl:template>

<xsl:template match="number"><xsl:value-of select="."/></xsl:template>

<xsl:template match="constant"><xsl:value-of select="."/></xsl:template>

<xsl:template match="sum">sum <xsl:apply-templates /></xsl:template>

<xsl:template match="mult">mult <xsl:apply-templates /></xsl:template>

<xsl:template match="fraction">fraction <xsl:apply-templates /></xsl:template>

<xsl:template match="segment_ratio">sratio <xsl:value-of select="segment[1]/point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="segment[1]/point[2]"/><xsl:text> </xsl:text>	
    <xsl:value-of select="segment[2]/point[1]"/><xsl:text> </xsl:text>	
    <xsl:value-of select="segment[2]/point[2]"/><xsl:text> </xsl:text>	
</xsl:template>

<xsl:template match="signed_area3">signed_area3 <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>	
    <xsl:value-of select="point[3]"/><xsl:text> </xsl:text>	
</xsl:template>

<xsl:template match="signed_area4">
  signed_area4 <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>	
    <xsl:value-of select="point[3]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[4]"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="pythagoras_difference3">
  pythagoras_difference3 <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
    <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>	
    <xsl:value-of select="point[3]"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="pythagoras_difference4">
  pythagoras_difference4 <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
   <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>	
   <xsl:value-of select="point[3]"/><xsl:text> </xsl:text>
   <xsl:value-of select="point[4]"/><xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="parallel">
  parallel <xsl:value-of select="point[1]"/><xsl:text> </xsl:text>
   <xsl:value-of select="point[2]"/><xsl:text> </xsl:text>	
   <xsl:value-of select="point[3]"/><xsl:text> </xsl:text>
   <xsl:value-of select="point[4]"/><xsl:text> </xsl:text>
</xsl:template>


</xsl:stylesheet>


