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
  FOOT "foot"
  MED "med"
  TRANSLATE "translate"
  TOWARDS "towards"
  INTERSECTION "intersection"
  ONLINE "online"                      
  ONCIRCLE "oncircle"            
  PROVE "prove"
  EQUAL "equal"
  PD3 "pythagoras difference 3"
  SA3 "signed_area3"
  SA4 "signed_area4"  
  SRATIO "signed ratio"
  SEGMENT "segment"
  ALGSUM3 "alg_sum_zero3"
  HARMONIC "harmonic"
  IDENTICAL "identical"
  SAMELENGTH "same_length"
  PARALLEL "parallel"
  COLLINEAR "collinear"
  PERPENDICULAR "perp"
  PERP "perpendicular"
  CMARK "cmark"
  CMARK_LABEL "cmark_label"
  DRAWSEGMENT "drawsegment"
  DRAWDASHSEGMENT "drawdashsegment"
  DRAWLINE "drawline"
  DRAWDASHLINE "drawdashline"
  DRAWCIRCLE "drawcircle"
  MULT "mult"
  SUM "sum"
  DIM "dim"
  AREA "area"
  COLOR "color"
  PROOFLEVEL "prooflevel"

%token <std::string> VARIABLE "variable"
%token <std::string> STRING "string"
%token <double> NUMBER "number"

%nterm <ExprPtr> hypothesis conjecture term

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
   drv.points.push_back(Point{$2, $3, $4});
   $$ = std::make_shared<FreePoint>($2, $3, $4);
}
| LINE VARIABLE VARIABLE VARIABLE {
   drv.lines.emplace($2, Line{$2, $3, $4});
   $$ = std::make_shared<Line>($2, $3, $4);
}
| CIRCLE VARIABLE VARIABLE VARIABLE {
   drv.circles.emplace($2, Circle{$2, $3, $4});
   $$ = std::make_shared<Circle>($2, $3, $4);
}
| MIDPOINT VARIABLE VARIABLE VARIABLE {
    drv.points.push_back(FreePoint{$2});
    $$ = std::make_shared<FunMidpoint>($2, $3, $4);
}
| FOOT VARIABLE VARIABLE VARIABLE {
    drv.points.push_back(FreePoint{$2});
    $$ = std::make_shared<FunFoot>($2, $3, $4);
}
| MED VARIABLE VARIABLE VARIABLE {
    $$ = std::make_shared<FunSegmentBisector>($2, $3, $4);
}
| ONLINE VARIABLE VARIABLE VARIABLE {
   drv.points.push_back(Point{$2});
  $$ = std::make_shared<OnLine_P>($2, $3, $4);
}
| ONCIRCLE VARIABLE VARIABLE VARIABLE {
   drv.points.push_back(Point{$2});
  $$ = std::make_shared<OnCircle_P>($2, $3, $4);
}
| PARALLEL VARIABLE VARIABLE VARIABLE {
    $$ = std::make_shared<FunParallel>($2, $3, $4);
}
| PERP VARIABLE VARIABLE VARIABLE {
    $$ = std::make_shared<FunPerpendicular>($2, $3, $4);
}
| TRANSLATE VARIABLE VARIABLE VARIABLE VARIABLE {
  drv.points.push_back(Point{$2});
  $$ = std::make_shared<FunTranslate>($2, $3, $4, $5);
}
| TOWARDS VARIABLE VARIABLE VARIABLE NUMBER {
  drv.points.push_back(Point{$2});
  $$ = std::make_shared<FunTowards>($2, $3, $4, $5);
}
| INTERSECTION VARIABLE VARIABLE VARIABLE VARIABLE VARIABLE {
  drv.points.push_back(Point{$2});
  $$ = std::make_shared<FunIntersectLL_P>($2, $3, $4, $5, $6);
}
| INTERSECTION VARIABLE VARIABLE VARIABLE {
  drv.points.push_back(Point{$2});
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
| DRAWCIRCLE VARIABLE {
  $$ = std::make_shared<DrawCircle>($2);
}
| DRAWCIRCLE VARIABLE VARIABLE {
  $$ = std::make_shared<DrawCircle_P>($2, $3);
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
   $$ = std::make_shared<Congruent>($4, $5, $6, $7);
}
| PROVE '{' COLLINEAR VARIABLE VARIABLE VARIABLE '}' {
  $$ = std::make_shared<Collinear>($4, $5, $6);
}
| PROVE '{' PARALLEL VARIABLE VARIABLE VARIABLE VARIABLE '}' {
  $$ = std::make_shared<ParallelDG_P>($4, $5, $6, $7);
}
| PROVE '{' PERPENDICULAR VARIABLE VARIABLE VARIABLE VARIABLE '}' {
  $$ = std::make_shared<PerpendicularDG_P>($4, $5, $6, $7);
}
| PROVE '{' HARMONIC VARIABLE VARIABLE VARIABLE VARIABLE '}' {
  $$ = std::make_shared<Harmonic>($4, $5, $6, $7);
  }
| PROVE '{' IDENTICAL VARIABLE VARIABLE '}' {
  $$ = std::make_shared<Identical>($4, $5);
  }
| PROVE '{' ALGSUM3 term term term '}' {
  $$ = std::make_shared<AlgSum3>($4, $5, $6);
  }
| PROVE '{' EQUAL term term '}'  {
  $$ = std::make_shared<Equal>($4, $5);
}
;

term :
  '{' SRATIO VARIABLE VARIABLE VARIABLE VARIABLE '}' {
    $$ = make_expression("sratio", $3, $4, $5, $6);
  }
| '{' SA3 VARIABLE VARIABLE VARIABLE '}' {
    $$ = make_expression("sa3", $3, $4, $5);
  }
| '{' SA4 VARIABLE VARIABLE VARIABLE VARIABLE '}' {
    $$ = make_expression("sa4", $3, $4, $5, $6);
  }
| '{' PD3 VARIABLE VARIABLE VARIABLE '}' {
    $$ = make_expression("pd3", $3, $4, $5);
  }
| '{' SEGMENT VARIABLE VARIABLE '}' {
    $$ = make_expression("segment", $3, $4);
  }
| '{' MULT term term '}' {
  $$ = make_expression("*", $3, $4);
  }
| '{' SUM term term '}' {
  $$ = make_expression("+", $3, $4);
  }
| '{' NUMBER '}' {
  $$ = std::make_shared<Constant>($2);
  }
| NUMBER {
  $$ = std::make_shared<Constant>($1);
  }
| '{' VARIABLE '}' {
  $$ = std::make_shared<Variable>($2);
  }
;

other:
  DIM NUMBER NUMBER
| AREA NUMBER NUMBER NUMBER NUMBER
| COLOR NUMBER NUMBER NUMBER
| PROOFLEVEL NUMBER
;

                
%%

void parser_gcl::parser_gcl::error (const location_type& l, const std::string& m)
{
  std::cerr << l << ": " << m << '\n';
}
