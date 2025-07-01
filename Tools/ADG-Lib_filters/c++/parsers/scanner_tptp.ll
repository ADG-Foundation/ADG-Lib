%{
/* -*- C++ -*- */
#include <cerrno>
#include <climits>
#include <cstdlib>
#include <cstring> // strerror
#include <string>
#include "driver_tptp.hh"
#include "parser_tptp.hh"
%}

%option noyywrap nounput noinput batch debug
%option prefix="scanner_tptp_"

%{
// Code run each time a pattern is matched.
#define YY_USER_ACTION  loc.columns (yyleng);

// Give Flex the prototype of yylex we want ...
#define YY_DECL \
  parser_tptp::parser_tptp::symbol_type yylex (driver_tptp& drv)


%}

%%

%{
  // A handy shortcut to the location held by the driver.
  parser_tptp::location& loc = drv.location;
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
(-?([0-9]+)|([0-9]*\.[0-9]+)) { return parser_tptp::parser_tptp::make_NUMBER(std::stod(yytext), loc); }

 /* Punctuation */
[()!,.=\[\]:&] return parser_tptp::parser_tptp::symbol_type(yytext[0], loc);
!=     { parser_tptp::parser_tptp::make_NEQ(loc); }
=>     { parser_tptp::parser_tptp::make_IMPLIES(loc); }

include { parser_tptp::parser_tptp::make_INCLUDE(loc); }
'[^']*' { parser_tptp::parser_tptp::make_STRING(yytext, loc); }
fof     { parser_tptp::parser_tptp::make_FOF(loc); }
conjecture { parser_tptp::parser_tptp::make_CONJECTURE(loc); }


 /* Identifiers */
[a-zA-Z_][a-zA-Z0-9_]* {
  return parser_tptp::parser_tptp::make_ID(yytext, loc);
}

 /* End of input */
<<EOF>>  { return parser_tptp::parser_tptp::make_END(loc); }

%%

void driver_tptp::scan_begin()
{
    yy_flex_debug = trace_scanning;
    if (file_name.empty() || file_name == "-")
        yyin = stdin;
    else if (!(yyin = fopen (file_name.c_str(), "r"))) {
        std::cerr << "cannot open " << file_name << ": " << strerror (errno) << '\n';
        exit(EXIT_FAILURE);
    }
}

void driver_tptp::scan_end()
{
  fclose(yyin);
}
