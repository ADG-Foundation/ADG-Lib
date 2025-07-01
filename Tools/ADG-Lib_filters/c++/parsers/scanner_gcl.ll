%{
/* -*- C++ -*- */
#include <cerrno>
#include <climits>
#include <cstdlib>
#include <cstring> // strerror
#include <string>
#include "driver_gcl.hh"
#include "parser_gcl.hh"
%}

%option noyywrap nounput noinput batch debug
%option prefix="scanner_gcl_"

%{
// Code run each time a pattern is matched.
#define YY_USER_ACTION  loc.columns (yyleng);

// Give Flex the prototype of yylex we want ...
#define YY_DECL \
  parser_gcl::parser_gcl::symbol_type yylex (driver_gcl& drv)


%}

%%

%{
  // A handy shortcut to the location held by the driver.
  parser_gcl::location& loc = drv.location;
  // Code run each time yylex is called.
  loc.step();
%}

 /* Ignore whitespace */
[ \t\r]+   loc.step();

 /* Comments */
%.*\n	{ loc.lines(1); loc.step(); }

 /* Empty lines */
\n+     { loc.lines(yyleng); loc.step(); }

 /* Numbers */
(-?([0-9]+)|([0-9]*\.[0-9]+)) { return parser_gcl::parser_gcl::make_NUMBER(std::stod(yytext), loc); }

 /* Strings */
\"[^\"\n]*[\"\n] {
   if (yytext[yyleng-1] != '"') 
     throw parser_gcl::parser_gcl::syntax_error (loc, "unterminated character string");
   std::string no_quotes(yytext + 1, yyleng - 2);
   return parser_gcl::parser_gcl::make_STRING(no_quotes, loc);
}
\$[^\$\n]*[\$\n] {
   if (yytext[yyleng-1] != '$') 
     throw parser_gcl::parser_gcl::syntax_error (loc, "unterminated character string");
   return parser_gcl::parser_gcl::make_STRING(yytext, loc);
}

 /* Reserved words */
point                   { return parser_gcl::parser_gcl::make_POINT(loc); }
line                    { return parser_gcl::parser_gcl::make_LINE(loc); }
circle                  { return parser_gcl::parser_gcl::make_CIRCLE(loc); }
midpoint                { return parser_gcl::parser_gcl::make_MIDPOINT(loc); }
med                     { return parser_gcl::parser_gcl::make_MED(loc); }
intersec                { return parser_gcl::parser_gcl::make_INTERSECTION(loc); }
intersection            { return parser_gcl::parser_gcl::make_INTERSECTION(loc); }
online                  { return parser_gcl::parser_gcl::make_ONLINE(loc); }
prove                   { return parser_gcl::parser_gcl::make_PROVE(loc); }
equal                   { return parser_gcl::parser_gcl::make_EQUAL(loc); }
sratio                  { return parser_gcl::parser_gcl::make_SRATIO(loc); }
signed_area3            { return parser_gcl::parser_gcl::make_SA3(loc); }
pythagoras_difference3  { return parser_gcl::parser_gcl::make_PD3(loc); }
harmonic                { return parser_gcl::parser_gcl::make_HARMONIC(loc); }
identical               { return parser_gcl::parser_gcl::make_IDENTICAL(loc); }
samelength              { return parser_gcl::parser_gcl::make_SAMELENGTH(loc); }
perp                    { return parser_gcl::parser_gcl::make_PERP(loc); }
perpendicular           { return parser_gcl::parser_gcl::make_PERPENDICULAR(loc); }
parallel                { return parser_gcl::parser_gcl::make_PARALLEL(loc); }
collinear               { return parser_gcl::parser_gcl::make_COLLINEAR(loc); }
cmark_lt                { return parser_gcl::parser_gcl::make_CMARK_LABEL(loc); }
cmark_rt                { return parser_gcl::parser_gcl::make_CMARK_LABEL(loc); }
cmark_l                 { return parser_gcl::parser_gcl::make_CMARK_LABEL(loc); }
cmark_r                 { return parser_gcl::parser_gcl::make_CMARK_LABEL(loc); }
cmark_t                 { return parser_gcl::parser_gcl::make_CMARK_LABEL(loc); }
cmark_b                 { return parser_gcl::parser_gcl::make_CMARK_LABEL(loc); }
cmark_lb                { return parser_gcl::parser_gcl::make_CMARK_LABEL(loc); }
cmark_rb                { return parser_gcl::parser_gcl::make_CMARK_LABEL(loc); }
cmark                   { return parser_gcl::parser_gcl::make_CMARK_LABEL(loc); }
drawsegment             { return parser_gcl::parser_gcl::make_DRAWSEGMENT(loc); }
drawdashsegment         { return parser_gcl::parser_gcl::make_DRAWDASHSEGMENT(loc); }
drawline                { return parser_gcl::parser_gcl::make_DRAWLINE(loc); }
drawcircle              { return parser_gcl::parser_gcl::make_DRAWCIRCLE(loc); }
drawdashline            { return parser_gcl::parser_gcl::make_DRAWDASHLINE(loc); }
mult                    { return parser_gcl::parser_gcl::make_MULT(loc); }
sum                     { return parser_gcl::parser_gcl::make_ADD(loc); }
dim                     { return parser_gcl::parser_gcl::make_DIM(loc); }
area                    { return parser_gcl::parser_gcl::make_AREA(loc); }
color                   { return parser_gcl::parser_gcl::make_COLOR(loc); }
prooflevel              { return parser_gcl::parser_gcl::make_PROOFLEVEL(loc); }

 /* Variables */
[a-zA-Z_][a-zA-Z0-9_']* {
  return parser_gcl::parser_gcl::make_VARIABLE(yytext, loc);
}

 /* Punctuation */
[{}] return parser_gcl::parser_gcl::symbol_type(yytext[0], loc);

 /* End of input */
<<EOF>>  { return parser_gcl::parser_gcl::make_END(loc); }


 /* Comments */
%.* {
}

  /* Any other character causes an error */
.  {
  throw parser_gcl::parser_gcl::syntax_error(loc, "invalid character: " + std::string(yytext));
}



%%

void driver_gcl::scan_begin()
{
    yy_flex_debug = trace_scanning;
    if (file_name.empty() || file_name == "-")
        yyin = stdin;
    else if (!(yyin = fopen (file_name.c_str(), "r"))) {
        std::cerr << "cannot open " << file_name << ": " << strerror (errno) << '\n';
        exit(EXIT_FAILURE);
    }
}

void driver_gcl::scan_end()
{
  fclose(yyin);
}
