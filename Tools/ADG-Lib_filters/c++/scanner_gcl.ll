%{
/* -*- C++ -*- */
#include <cerrno>
#include <climits>
#include <cstdlib>
#include <cstring> // strerror
#include <string>
#include "driver.hh"
#include "parser_gcl.hh"
%}

%option noyywrap nounput noinput batch debug

%{
  // Code run each time a pattern is matched.
  # define YY_USER_ACTION  loc.columns (yyleng);
%}

%%

%{
  // A handy shortcut to the location held by the driver.
  yy::location& loc = drv.location;
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
(([0-9]+)|([0-9]*\.[0-9]+)) { return yy::parser::make_NUMBER(std::stod(yytext), loc); }

 /* Strings */
\"[^\"\n]*[\"\n] {
   if (yytext[yyleng-1] != '"') 
     throw yy::parser::syntax_error (loc, "unterminated character string");
   std::string no_quotes(yytext + 1, yyleng - 2);
   return yy::parser::make_STRING(no_quotes, loc);
}
\$[^\$\n]*[\$\n] {
   if (yytext[yyleng-1] != '$') 
     throw yy::parser::syntax_error (loc, "unterminated character string");
   return yy::parser::make_STRING(yytext, loc);
}

 /* Reserved words */
point                   { return yy::parser::make_POINT(loc); }
line                    { return yy::parser::make_LINE(loc); }
circle                  { return yy::parser::make_CIRCLE(loc); }
midpoint                { return yy::parser::make_MIDPOINT(loc); }
intersection            { return yy::parser::make_INTERSECTION(loc); }
online                  { return yy::parser::make_ONLINE(loc); }
prove                   { return yy::parser::make_PROVE(loc); }
equal                   { return yy::parser::make_EQUAL(loc); }
sratio                  { return yy::parser::make_SRATIO(loc); }
signed_area3            { return yy::parser::make_SA3(loc); }
pythagoras_difference3  { return yy::parser::make_PD3(loc); }
samelength              { return yy::parser::make_SAMELENGTH(loc); }
parallel                { return yy::parser::make_PARALLEL(loc); }
cmark_lt                { return yy::parser::make_CMARK(loc); }
drawsegment             { return yy::parser::make_DRAWSEGMENT(loc); }

 /* Variables */
[a-zA-Z_][a-zA-Z0-9_']* {
  return yy::parser::make_VARIABLE(yytext, loc);
}

 /* Punctuation */
[{}] return yy::parser::symbol_type(yytext[0], loc);

 /* End of input */
<<EOF>>  { return yy::parser::make_END(loc); }


  /* Any other character causes an error */
.  {
  throw yy::parser::syntax_error(loc, "invalid character: " + std::string(yytext));
}



%%

void driver::scan_begin()
{
    yy_flex_debug = trace_scanning;
    if (file_name.empty() || file_name == "-")
        yyin = stdin;
    else if (!(yyin = fopen (file_name.c_str(), "r"))) {
        std::cerr << "cannot open " << file_name << ": " << strerror (errno) << '\n';
        exit(EXIT_FAILURE);
    }
}

void driver::scan_end()
{
  fclose(yyin);
}
