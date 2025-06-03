// -*- C++ -*-
%skeleton "lalr1.cc"
%require "3.5.1"
%defines

%define api.token.constructor
%define api.value.type variant
%define api.namespace {parser_gcl}
%define api.parser.class {parser_gcl}
%define parse.assert

%code requires {
    #include <string>
    #include "expression.hh"
    class driver_gcl;
}

%param { driver_gcl& drv }

%locations
%define api.location.file "parser_gcl_location.hh"

%define parse.trace
%define parse.error verbose
%define parse.lac full

%code {
#include "driver_gcl.hh"
#include "expression.hh"
parser_gcl::parser_gcl::symbol_type yylex (driver_gcl& drv);
}

%{
extern int scanner_gcl_lex(void);  // tell Bison to call this instead of yylex
  #define yylex scanner_gcl_lex      // redirect yylex to lexer1lex
%}

%define api.token.prefix {TOK_}

%token
  END 0 "end of input"                       
  POINT "point"
  LINE "line"
  CIRCLE "circle"
  MIDPOINT "midpoint"
  MED "med"
  INTERSECTION "intersection"
  ONLINE "on line"                      
  PROVE "prove"
  EQUAL "equal"
  PD3 "pythagoras difference 3"
  SA3 "signed area 3"
  SRATIO "signed ratio"
  SAMELENGTH "same_length"
  PARALLEL "parallel"
  PERPENDICULAR "perp"
  PERP "perpendicular"
  CMARK "cmark"
  CMARK_LABEL "cmark_label"
  DRAWSEGMENT "drawsegment"
  DRAWDASHSEGMENT "drawdashsegment"
  DRAWLINE "drawline"
  DRAWDASHLINE "drawdashline"
  DIM "dim"
                        
%token <std::string> VARIABLE "variable"
%token <std::string> STRING "string"
%token <int> NUMBER "number"

%nterm <ExprPtr> hypothesis conjecture

%printer { yyo << $$; } <*>;

%start gcl

%%

gcl: input { }
        ;

input: 
       text_line
     | input '\n' text_line
     ;


text_line: %empty
    | text_line hypothesis { drv.hypotheses.push_back($2); }
    | text_line conjecture { drv.conjectures.push_back($2); }
    | text_line other { /* other commands are ignored */ }
    ;


hypothesis:
 POINT VARIABLE NUMBER NUMBER {
   drv.points.push_back(FreePoint{$2, $3, $4});
   $$ = std::make_shared<FreePoint>($2, $3, $4);
}
| LINE VARIABLE VARIABLE VARIABLE {
   drv.lines.emplace($2, Line{$2, $3, $4});
   $$ = std::make_shared<Line>($2, $3, $4);
}
| MIDPOINT VARIABLE VARIABLE VARIABLE {
    $$ = std::make_shared<FunMidpoint>($2, $3, $4);
}
| MED VARIABLE VARIABLE VARIABLE {
    $$ = std::make_shared<FunSegmentBisector>($2, $3, $4);
}
| ONLINE VARIABLE VARIABLE VARIABLE {
    $$ = make_expression("coll", $2, $3, $4);
}
| PARALLEL VARIABLE VARIABLE VARIABLE {
    $$ = std::make_shared<FunParallel>($2, $3, $4);
}
| PERP VARIABLE VARIABLE VARIABLE {
    $$ = std::make_shared<FunPerpendicular>($2, $3, $4);
}
| CIRCLE VARIABLE VARIABLE VARIABLE {
    // FIXME: $1 - circle id is not used?
    std::string aux_point1 = AuxiliaryPoints::get();
    drv.points.push_back(aux_point1);
    std::string aux_point2 = AuxiliaryPoints::get();
    drv.points.push_back(aux_point2);
    $$ = make_expression("circle", $3, $4, aux_point1, aux_point2);
}
| INTERSECTION VARIABLE VARIABLE VARIABLE VARIABLE VARIABLE {
  ExprPtr coll1 = make_expression("coll", $3, $4, $2);
  ExprPtr coll2 = make_expression("coll", $5, $6, $2);
  $$ = make_expression("&", coll1, coll2);
}
| INTERSECTION VARIABLE VARIABLE VARIABLE {
  $$ = std::make_shared<FunIntersectLL>($2, $3, $4);
}
| CMARK VARIABLE {
  $$ = std::make_shared<DrawPoint>($2);
}
| CMARK_LABEL VARIABLE {
  $$ = make_expression("&",
                       std::make_shared<LabelPoint>($2),
                       std::make_shared<DrawPoint>($2));
}
| DRAWSEGMENT VARIABLE VARIABLE {
  $$ = std::make_shared<DrawSegment>($2, $3);
}
| DRAWDASHSEGMENT VARIABLE VARIABLE {
  $$ = std::make_shared<DrawSegment>($2, $3, DASHED);
}
| DRAWLINE VARIABLE {
  $$ = std::make_shared<DrawLine>($2);
}
| DRAWLINE VARIABLE VARIABLE {
  $$ = std::make_shared<DrawLine_P>($2, $3);
}
| DRAWDASHLINE VARIABLE {
  $$ = std::make_shared<DrawLine>($2, DASHED);
}
| DRAWDASHLINE VARIABLE VARIABLE {
  $$ = std::make_shared<DrawLine_P>($2, $3, DASHED);
}
;

conjecture:
 PROVE '{' SAMELENGTH VARIABLE VARIABLE VARIABLE VARIABLE '}'  {
   $$ = make_expression("cong", $4, $5, $6, $7);
}
| PROVE '{' PARALLEL VARIABLE VARIABLE VARIABLE VARIABLE '}' {
  $$ = make_expression("parallel", $4, $5, $6, $7);
}
| PROVE '{' PERPENDICULAR VARIABLE VARIABLE VARIABLE VARIABLE '}' {
  $$ = make_expression("perpendicular", $4, $5, $6, $7);
}
// P_ACD = P_BCD, AB perpendicular to CD
| PROVE '{' EQUAL '{' PD3 VARIABLE VARIABLE VARIABLE '}' '{' PD3 VARIABLE VARIABLE VARIABLE '}' '}'  {
  // FIXME: strange
  // sprintf(tptpConjectures[numConj++].conjecture,"pythagoras_difference3 %s %s %s  pythagoras_difference3 %s %s %s ",$6,$7,$8,$12,$13,$14);
}
// S_ABC=0, points A,B,C are collinear
| PROVE '{' EQUAL '{' SA3 VARIABLE VARIABLE VARIABLE '}' '{' NUMBER '}' '}'  {
  // FIXME: shouldn't number be zero?
  $$ = make_expression("coll", $6,$7,$8);
}
// S_ABC=0, points A,B,C are collinear
| PROVE '{' EQUAL '{' SA3 VARIABLE VARIABLE VARIABLE '}' NUMBER '}'  {
  // FIXME: shouldn't number be zero?
  $$ = make_expression("coll", $6,$7,$8);
}
// sratio_ABCD = sratio_EFGH
| PROVE '{' EQUAL '{' SRATIO VARIABLE VARIABLE VARIABLE VARIABLE '}' '{'  SRATIO VARIABLE VARIABLE VARIABLE VARIABLE '}' '}' {
  $$ = make_expression("eqratio",$6,$7,$8,$9,$13,$14,$15,$16);
}
;

other: DIM NUMBER NUMBER
;

                
%%

void parser_gcl::parser_gcl::error (const location_type& l, const std::string& m)
{
  std::cerr << l << ": " << m << '\n';
}
