<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" omit-xml-declaration="yes" />

<xsl:template match="@* | node()">
  <xsl:copy>
    <xsl:apply-templates select="@* | node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="text()"><xsl:value-of select='translate(., "&apos;&#x0d;&#x0a;&#x09;", "p")'/></xsl:template> 

<xsl:template match="/">
  <xsl:for-each select="figure">			
  <xsl:apply-templates />
  </xsl:for-each>
</xsl:template>

<xsl:template match="filename">
  <xsl:text>%--------------------------------------------------------------------------</xsl:text>
  <xsl:text>&#xa;% File     : </xsl:text><xsl:value-of select="." />  
  <xsl:text>&#xa;% Domain   : Geometry </xsl:text>  
  <xsl:text>&#xa;% Problem  : ...</xsl:text> 
  <xsl:text>&#xa;% Source   : Converted from GCLC Goran Predovic Collection of Theorems</xsl:text> 
  <xsl:text>&#xa;% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988</xsl:text>  
  <xsl:text>&#xa;% Status   : Valid</xsl:text>
  <xsl:text>&#xa;%--------------------------------------------------------------------------</xsl:text>
  <xsl:text>&#xa;%----Include geometry axioms</xsl:text>
  <xsl:text>&#xa;include('geo.ax').</xsl:text>
  <xsl:text>&#xa;%--------------------------------------------------------------------------</xsl:text>  
</xsl:template>

<xsl:template match="comment()">
<xsl:text>&#xa;</xsl:text><xsl:text>%</xsl:text><xsl:value-of select="." />
</xsl:template>

<!--**************objects **************-->

<xsl:template match="define">
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="fixed_point">
  fof(intro_p_<xsl:value-of select="."/>, axiom, freepoint<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates /><xsl:text>, </xsl:text>
    <xsl:value-of select="@x"/><xsl:text>, </xsl:text> 
    <xsl:value-of select="@y"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="point">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="center">
  <xsl:apply-templates/>  	
</xsl:template>

<xsl:template match="angle">
  <xsl:apply-templates/>  	
</xsl:template>

<xsl:template match="coefficient">
  <xsl:apply-templates/>  	
</xsl:template>

<xsl:template match="new_point">
  <xsl:apply-templates /> 						  
</xsl:template>

<xsl:template match="new_line">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="new_circle">
  <xsl:apply-templates/> 	
</xsl:template>


<!--**************constructions**************-->

<xsl:template match="construct">
  <xsl:text>&#xa;</xsl:text>
  <xsl:apply-templates /> 						
</xsl:template>

<xsl:template match="ruler">
  fof(intro_line_<xsl:apply-templates select="new_line"/>, axiom, newline<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_line"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>)).</xsl:text>
</xsl:template>

<xsl:template match="intersection">
  fof(intersec_ll_<xsl:apply-templates select="new_point"/>, axiom, intersec_ll<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="line[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="line[2]"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="intersection_cc">
  fof(intersec_cc_<xsl:apply-templates select="new_point[1]"/>_<xsl:apply-templates select="new_point[2]"/>, axiom, intersec_cc<xsl:text>(</xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point[1]"/><xsl:text>, </xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point[2]"/><xsl:text>, </xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="circle[1]"/><xsl:text>, </xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="circle[2]"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="intersection_cl">
  fof(intersec_cl_<xsl:apply-templates select="new_point[1]"/>_<xsl:apply-templates select="new_point[2]"/>, axiom, intersec_cl<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point[2]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="circle"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="line"/><xsl:text>)). </xsl:text>	
</xsl:template>

<xsl:template match="midpoint">
  fof(midpoint_<xsl:apply-templates select="new_point"/>, axiom, midp<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="foot">
  fof(foot_<xsl:apply-templates select="new_point"/>, axiom, foot<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="line"/><xsl:text>)).</xsl:text>
</xsl:template>

<xsl:template match="random_point_on_line ">
  fof(online_<xsl:apply-templates select="new_point"/>, axiom, coll<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>)). </xsl:text>    		
</xsl:template>

<xsl:template match="random_point_on_circle ">
  fof(oncircle_<xsl:apply-templates select="new_point"/>, axiom, oncircle<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>)). </xsl:text>    		
</xsl:template>

<xsl:template match="translate">
  fof(translate_<xsl:apply-templates select="new_point"/>, axiom, translate<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="vector/point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="vector/point[2]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>)).</xsl:text>
</xsl:template>

<xsl:template match="towards">
  fof(towards_<xsl:apply-templates select="new_point"/>, axiom, towards<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="vector/point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="vector/point[2]"/><xsl:text>, </xsl:text>
    <xsl:apply-templates select="coefficient"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="rotate">
  fof(rotate_<xsl:apply-templates select="new_point"/>, axiom, rotate<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="center"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="angle"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>)). </xsl:text>	
</xsl:template>

<xsl:template match="half_turn">
  fof(half_turn_<xsl:apply-templates select="new_point"/>, axiom, half_turn<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="center"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>)). </xsl:text>	
</xsl:template>

<xsl:template match="line_reflection">
  fof(line_reflection_<xsl:apply-templates select="new_point"/>, axiom, line_reflection<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="line"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>)). </xsl:text>		
</xsl:template>

<xsl:template match="inversion">
  fof(inversion_<xsl:apply-templates select="new_point"/>, axiom, inversion<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="circle"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>)).</xsl:text>		
</xsl:template>

<xsl:template match="segment_bisector">
  fof(med_<xsl:apply-templates select="new_line"/>, axiom, med<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_line"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="angle_bisector">
  fof(bis_<xsl:apply-templates select="new_line"/>, axiom, angle_bisector<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_line"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[3]"/><xsl:text>)).</xsl:text>		
</xsl:template>

<xsl:template match="compass">
  fof(new_circle_<xsl:apply-templates select="new_circle"/>, axiom, newcircle<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_circle"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="center"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>)).</xsl:text>	
</xsl:template>


<!--**************properties**************-->

<xsl:template match="parallel">
  <xsl:if test="ancestor::prove">paraNS<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[3]"/><xsl:text>, </xsl:text>    
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[4]"/><xsl:text>) </xsl:text>
  </xsl:if>
  <xsl:if test="not(ancestor::prove)">
  fof(parallel_<xsl:apply-templates select="new_line"/>, axiom, paraS<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_line"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="line"/><xsl:text>)). </xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="perpendicular">
  <xsl:if test="ancestor::prove">perpNS<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[3]"/><xsl:text>, </xsl:text>    
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[4]"/><xsl:text>) </xsl:text>
  </xsl:if>
  <xsl:if test="not(ancestor::prove)">
  fof(perpendicular_<xsl:apply-templates select="new_line"/>, axiom, perpS<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="new_line"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="line"/><xsl:text>)). </xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="collinear">collinear<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>    
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[3]"/><xsl:text>) </xsl:text>
</xsl:template>

<xsl:template match="harmonic">harmonic<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>    
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>, </xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[3]"/><xsl:text>, </xsl:text>    
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point[4]"/><xsl:text>) </xsl:text>
</xsl:template>


<!--**************layout and drawing**************-->

<xsl:template match="dimensions"><xsl:text>  fof(layout_dim, axiom, dimensions(</xsl:text>
    <xsl:value-of select="@width"/> <xsl:text>, </xsl:text>
    <xsl:value-of select="@height"/> <xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="area"><xsl:text>&#xa;  fof(layout_area, axiom, area(</xsl:text>
    <xsl:value-of select="@x1"/> <xsl:text>, </xsl:text>
    <xsl:value-of select="@y1"/> <xsl:text>, </xsl:text>
    <xsl:value-of select="@x2"/> <xsl:text>, </xsl:text>
    <xsl:value-of select="@y2"/> <xsl:text>)). </xsl:text>
</xsl:template>

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

<xsl:template match="segment">
  <xsl:choose>
    <xsl:when test="ancestor::expression"> length<xsl:text>(</xsl:text> 
      <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
      <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>)</xsl:text>    
    </xsl:when>
    <xsl:when test="ancestor::draw"> 
       <xsl:text>&#xa;  fof(layout, axiom, draw</xsl:text><xsl:if test="../@dashed='yes'">dash</xsl:if>segment<xsl:text>(</xsl:text> 
       <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
       <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>)). </xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
      <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text></xsl:text>    
    </xsl:otherwise>
  </xsl:choose>    
</xsl:template>

<xsl:template match="vector">
  <xsl:text>&#xa;  fof(layout, axiom, draw</xsl:text><xsl:if test="../@dashed='yes'">dash</xsl:if>vector<xsl:text>(</xsl:text> 
  <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="line_pp">
  <xsl:text>&#xa;  fof(layout, axiom, draw</xsl:text><xsl:if test="../@dashed='yes'">dash</xsl:if>line<xsl:text>(</xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>)). </xsl:text> 
</xsl:template>

<xsl:template match="line">
  <xsl:if test="not(ancestor::draw)">
    <xsl:apply-templates />
  </xsl:if>
  <xsl:if test="ancestor::draw">
    <xsl:text>&#xa;  fof(layout, axiom, draw</xsl:text><xsl:if test="../@dashed='yes'">dash</xsl:if>line<xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates /><xsl:text>)).</xsl:text> 
  </xsl:if>
</xsl:template>

<xsl:template match="circle">
  <xsl:if test="not(ancestor::draw)">
    <xsl:apply-templates />
  </xsl:if>
  <xsl:if test="ancestor::draw">
    <xsl:text>&#xa;  fof(layout, axiom, draw</xsl:text><xsl:if test="../@dashed='yes'">dash</xsl:if>circle<xsl:text>(</xsl:text> 
    <xsl:text>obj</xsl:text><xsl:apply-templates/><xsl:text>)).</xsl:text> 	
  </xsl:if>  
</xsl:template>

<xsl:template match="circle_cp">
  <xsl:text>&#xa;  fof(layout, axiom, draw</xsl:text><xsl:if test="../@dashed='yes'">dash</xsl:if>circle<xsl:text>(</xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="center"/><xsl:text>, </xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="arc">
  <xsl:text>&#xa;  fof(layout, axiom, draw</xsl:text><xsl:if test="../@dashed='yes'">dash</xsl:if>arc<xsl:text>(</xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="center"/><xsl:text>, </xsl:text>
  <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>, </xsl:text>
  <xsl:apply-templates select="angle"/><xsl:text>)).</xsl:text>
</xsl:template>


<!--**************labeling**************-->

<xsl:template match="labels">
  <xsl:text>&#xa;</xsl:text>  
  <xsl:apply-templates /> 						
</xsl:template>

<xsl:template match="point_label">
  <xsl:text>&#xa;  fof(layout, axiom, </xsl:text>  
<xsl:choose>
<xsl:when test="@direction &gt; 0">
  <xsl:choose>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 22.5">cmark_r</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 67.5">cmark_rt</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 112.5">cmark_t</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 157.5">cmark_lt</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 202.5">cmark_l</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 247.5">cmark_lb</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 292.5">cmark_b</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 337.5">cmark_rb</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 361">cmark_r</xsl:when>
    <xsl:otherwise>cmark </xsl:otherwise>
  </xsl:choose>
</xsl:when>
<xsl:otherwise>
  <xsl:choose>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 22.5">cmark_r</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 67.5">cmark_rt</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 112.5">cmark_t</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 157.5">cmark_lt</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 202.5">cmark_l</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 247.5">cmark_lb</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 292.5">cmark_b</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 337.5">cmark_rb</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 361">cmark_r</xsl:when>
    <xsl:otherwise>cmark </xsl:otherwise></xsl:choose>
  </xsl:otherwise>
</xsl:choose><xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="text_label">
  <xsl:text>&#xa;  fof(layout, axiom, </xsl:text>  
<xsl:choose>
<xsl:when test="@direction &gt; 0">
  <xsl:choose>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 22.5">printat_r</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 67.5">printat_rt</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 112.5">printat_t</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 157.5">printat_lt</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 202.5">printat_l</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 247.5">printat_lb</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 292.5">printat_b</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 337.5">printat_rb</xsl:when>
    <xsl:when test="(@direction mod 360) &lt; 360">printat_r</xsl:when>
    <xsl:otherwise>printat</xsl:otherwise>
  </xsl:choose>
  </xsl:when>
  <xsl:otherwise>
  <xsl:choose>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 22.5">printat_r</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 67.5">printat_rt</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 112.5">printat_t</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 157.5">printat_lt</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 202.5">printat_l</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 247.5">printat_lb</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 292.5">printat_b</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 337.5">printat_rb</xsl:when>
    <xsl:when test="(-((-@direction) mod 360)+360) &lt; 360">printat_r</xsl:when>
    <xsl:otherwise>printat</xsl:otherwise>
  </xsl:choose>
  </xsl:otherwise>
  </xsl:choose><xsl:text>(</xsl:text>
    <xsl:text>obj</xsl:text><xsl:apply-templates select="point"/><xsl:text>, </xsl:text>
    <xsl:value-of select="text"/><xsl:text>)). </xsl:text>
</xsl:template>

<xsl:template match="text">
  <xsl:text> {</xsl:text>
    <xsl:apply-templates />
  <xsl:text>} </xsl:text>	
</xsl:template>

<!--**************conjectures***********-->

<xsl:template match="conjecture">
  <xsl:text>&#xa;</xsl:text>  
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="prove">
  fof(layout, axiom, prooflevel(<xsl:value-of select="@proof_level"/><xsl:text>)).</xsl:text>
<!-- prooflimit <xsl:value-of select="@proof_limit"/><xsl:text> </xsl:text> --> 
  fof(thm, conjecture, <xsl:apply-templates/><xsl:text>).</xsl:text>  
</xsl:template>

<xsl:template match="equality">
  (<xsl:apply-templates select="expression[1]"/><xsl:text>= </xsl:text>
   <xsl:apply-templates select="expression[2]"/><xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="expression"> <xsl:apply-templates/> </xsl:template>

<xsl:template match="number"><xsl:value-of select="."/></xsl:template>

<xsl:template match="constant"><xsl:apply-templates select="."/></xsl:template>

<xsl:template match="sum">sum<xsl:text>(</xsl:text>  
  <xsl:apply-templates select="expression[1]"/><xsl:text>,</xsl:text>
  <xsl:apply-templates select="expression[2]"/><xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="mult">mult<xsl:text>(</xsl:text>  
  <xsl:apply-templates select="expression[1]"/><xsl:text>,</xsl:text>
  <xsl:apply-templates select="expression[2]"/><xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="fraction">fraction <xsl:apply-templates /></xsl:template>

<xsl:template match="equal_segments">same_length<xsl:text>(</xsl:text>  
   <xsl:apply-templates select="segment[1]"/><xsl:text>, </xsl:text>
   <xsl:apply-templates select="segment[2]"/><xsl:text>) </xsl:text>	
</xsl:template>

<xsl:template match="algebraic_sum_is_zero">alg_sum_zero3<xsl:text>(</xsl:text>  
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[1]/point[1]"/><xsl:text>, </xsl:text>
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[1]/point[2]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[2]/point[1]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[2]/point[2]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[3]/point[1]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[3]/point[2]"/><xsl:text>) </xsl:text>	
</xsl:template>


<xsl:template match="segment_ratio">sratio<xsl:text>(</xsl:text>  
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[1]/point[1]"/><xsl:text>, </xsl:text>
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[1]/point[2]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[2]/point[1]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="segment[2]/point[2]"/><xsl:text>) </xsl:text>	
</xsl:template>

<xsl:template match="signed_area3">signed_area3<xsl:text>(</xsl:text> 
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[3]"/><xsl:text>) </xsl:text>	
</xsl:template>

<xsl:template match="signed_area4">signed_area4<xsl:text>(</xsl:text> 
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[3]"/><xsl:text>, </xsl:text>
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[4]"/><xsl:text>) </xsl:text>
</xsl:template>

<xsl:template match="pythagoras_difference3">pythagoras_difference3<xsl:text>(</xsl:text> 
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[3]"/><xsl:text>) </xsl:text>
</xsl:template>

<xsl:template match="pythagoras_difference4">pythagoras_difference4<xsl:text>(</xsl:text>
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[1]"/><xsl:text>, </xsl:text>
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[2]"/><xsl:text>, </xsl:text>	
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[3]"/><xsl:text>, </xsl:text>
   <xsl:text>obj</xsl:text><xsl:apply-templates select="point[4]"/><xsl:text>) </xsl:text>
</xsl:template>


</xsl:stylesheet>


