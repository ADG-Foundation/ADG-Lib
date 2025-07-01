// -*- C++ -*-
%skeleton "lalr1.cc"
%require "3.5.1"
%defines

%define api.token.constructor
%define api.value.type variant
%define api.namespace {parser_jgex}
%define api.parser.class {parser_jgex}
%define parse.assert

%code requires {
    #include <string>
    #include "expression.hh"
    class driver_jgex;
}

%param { driver_jgex& drv }

%locations
%define api.location.file "parser_jgex_location.hh"

%define parse.trace
%define parse.error verbose
%define parse.lac full

%code {
#include "driver_jgex.hh"
#include "expression.hh"
parser_jgex::parser_jgex::symbol_type yylex (driver_jgex& drv);
}

%{
extern int scanner_jgex_lex(void);  // tell Bison to call this instead of yylex
  #define yylex scanner_jgex_lex      // redirect yylex to lexer1lex
%}

%define api.token.prefix {TOK_}

%token
  END 0 "end of input"                       
  POINT "point"
  MIDPOINT "midpoint"
  FOOT "foot"
  PERPENDICULAR "perpendicular"
  ONLINE "online"
  LINE "line"
  CIRCLE "circle"
  ONCIRCLE "oncircle"
  ONRCIRCLE "onrcircle"
  CYCLIC "cyclic"
  RECTANGLE "rectangle"
  REFLECTION "reflection"
  ORTHOCENTER "orthocenter"
  CIRCUMCENTER "circumcenter"
  ONTLINE "ontline"
  PARALLELOGRAM "parallelogram"
  QUADRANGLE "quadrangle"
  COLLINEAR "collinear"
  PARALLEL "parallel"
  LCTANGENT "lctangent"
  CONTRIANGLE "contriangle"
  TRIANGLE "triangle"
  RTRIANGLE "rtriangle"
  PETRIANGLE "petriangle"
  SIMTRIANGLE "simtriangle"
  ISOTRIANGLE "isotriangle"
  EQTRIANGLE "eqtriangle"
  SQUARE "square"
  NSQUARE "nsquare"
  PSQUARE "psquare"
  EQDISTANCE "eqdistance"
  ONBLINE "onbline"
  ONPLINE "onpline"
  ONALINE "onaline"
  ANGLEBISECTOR "anglebisector"
  INCENTER "incenter"
  LRATIO "lratio"
  PRATIO "pratio"
  TRATIO "tratio"
  RATIO "ratio"
  PENTAGON "pentagon"
  INTERSECTIONCC "intersectioncc"
  INTERSECTIONLC "intersectionlc"
  INTERSECTIONLL "intersectionll"
  INTERSECTIONLT "intersectionlt"
  INTERSECTIONPP "intersectionpp"
  SANGLE "sangle"
  EQANGLE "equangle"
  RTRAPEZOID "rtrapezoid"
  TRAPEZOID "trapezoid"
  SYM "sym"
  SEPARATOR "separator"
  SHOW "show"
  NOSHOW "no show"
  FINAL "final"
%token <std::string> VARIABLE 
%token <double> NUMBER

%nterm <std::vector<std::string>> variables
%nterm <ExprPtr> relation

%printer { for (const std::string& s : $$) yyo << s << " "; } <std::vector<std::string>>;
%printer { yyo << $$; } <*>;

%start jgex

%%

jgex: lines
    ;

lines: lines relation SEPARATOR {
  if (!drv.show)
    drv.hypotheses.push_back($2);
  else
    drv.conjectures.push_back($2);
}
| lines points SEPARATOR
| %empty
| lines other
      ;


points : POINT variables {
  for (const std::string& s : $2)
    drv.points.push_back(s);
}
;

other: SHOW {
  drv.show = true;
 }
| NOSHOW {
   
}
;


relation: 
   MIDPOINT VARIABLE VARIABLE VARIABLE {
     $$ = std::make_shared<Midpoint>($2, $3, $4);
}  
|  FOOT VARIABLE VARIABLE VARIABLE VARIABLE {
     $$ = std::make_shared<Foot_P>($2, $3, $4, $5);
}
|  PERPENDICULAR VARIABLE VARIABLE VARIABLE VARIABLE {
  $$ = std::make_shared<Perpendicular_P>($2, $3, $4, $5);
}
| ONLINE VARIABLE VARIABLE VARIABLE {
  $$ = std::make_shared<OnLine_P>($2, $3, $4);
}
| ONRCIRCLE VARIABLE VARIABLE VARIABLE VARIABLE {
  /* circle E O A with EO _|_ AO */
  std::string aux_point = AuxiliaryPoints::get();
  drv.points.push_back(aux_point);
  ExprPtr circle = make_expression("circle", $3, $4, $2, aux_point);
  ExprPtr perp = make_expression("perp", $2, $3, $4, $5);
  $$ = make_expression("&", circle, perp);
}
| CYCLIC VARIABLE VARIABLE VARIABLE VARIABLE {
  $$ = make_expression("cyclic", $2, $3, $4, $5);
}
| ONCIRCLE VARIABLE VARIABLE VARIABLE {
  /* oncircle v1 v2 v3 -> circle(v2,v3,v1,n1) */
  std::string aux_point = AuxiliaryPoints::get();
  drv.points.push_back(aux_point);
  $$ = make_expression("circle", $3, $4, $2, aux_point);
}
| ONTLINE VARIABLE VARIABLE VARIABLE VARIABLE {
  $$ = std::make_shared<OnPerpendicular_P>($2, $3, $4, $5);
}
| ONPLINE VARIABLE VARIABLE VARIABLE VARIABLE {
  $$ = make_expression("para", $4, $5, $3, $2);
}
| ONBLINE VARIABLE VARIABLE VARIABLE {
   /* Point on Bisection 
    * onbline C A B =
    *   midpoint(M,A,B) & perp(A,B,M,C)
    */
  std::string aux_point = AuxiliaryPoints::get();
  drv.points.push_back(aux_point);
  ExprPtr midpoint = make_expression("midpoint", aux_point, $3, $4);
  ExprPtr perp = make_expression($3, $4, aux_point, $2);
  $$ = make_expression("&", midpoint, perp);
}  
| ONALINE VARIABLE VARIABLE VARIABLE VARIABLE VARIABLE VARIABLE {
  $$ = make_expression("eqangle", $2, $3, $3, $4, $5, $6, $6, $7);
}
| COLLINEAR VARIABLE VARIABLE VARIABLE {
   $$ = std::make_shared<Collinear>($2, $3, $4);
}
| INTERSECTIONLL VARIABLE VARIABLE VARIABLE VARIABLE VARIABLE {
     ExprPtr col1 = std::make_shared<Collinear>($2, $3, $4);
     ExprPtr col2 = std::make_shared<Collinear>($2, $5, $6);
     $$ = make_expression("&", col1, col2);
}
;

variables:
  variables VARIABLE {
  $$ = $1;
  $$.push_back($2);
}
| VARIABLE {
  $$.push_back($1);
}         
;


%%

void parser_jgex::parser_jgex::error (const location_type& l, const std::string& m)
{
  std::cerr << l << ": " << m << '\n';
}
