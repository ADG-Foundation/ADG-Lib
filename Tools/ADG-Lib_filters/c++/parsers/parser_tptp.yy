// -*- C++ -*-
%skeleton "lalr1.cc"
%require "3.5.1"
%defines

%define api.token.constructor
%define api.value.type variant
%define api.namespace {parser_tptp}
%define api.parser.class {parser_tptp}
%define parse.assert

%code requires {
    #include <string>
    #include "expression.hh"
    class driver_tptp;
}

%param { driver_tptp& drv }

%locations
%define api.location.file "parser_tptp_location.hh"

%define parse.trace
%define parse.error verbose
%define parse.lac full

%code {
#include "driver_tptp.hh"
#include "expression.hh"
parser_tptp::parser_tptp::symbol_type yylex (driver_tptp& drv);
}

%{
extern int scanner_tptp_lex(void);  // tell Bison to call this instead of yylex
  #define yylex scanner_tptp_lex      // redirect yylex to lexer1lex
%}

%define api.token.prefix {TOK_}

%token
  END 0 "end of input"
  FOF "fof"
  CONJECTURE "conjecture"
  INCLUDE "include"
  NEQ "not equal"
  IMPLIES "implies"
  

%token <std::string> ID "identifier"
%token <std::string> STRING "string"
%token <double> NUMBER "number"

%nterm<std::vector<std::string>> variables

%printer { for (const std::string& s : $$) yyo << s << " "; } <std::vector<std::string>>;
%printer { yyo << $$; } <*>;

%start tptp

%nonassoc ':'
%left IMPLIES
%left '&'

%%

tptp: include fof
        ;

include: INCLUDE '(' STRING ')' '.'
       ;

fof: FOF '(' ID ',' CONJECTURE ',' formula ')' '.'
   ;

formula : '(' formula ')'
        | ID
        | NUMBER
        | ID '(' variables ')'
        | '!' '[' variables ']' ':' formula
        | formula IMPLIES formula
        | formula '&' formula
        ;

variables : variables ',' ID { $$.push_back($3); }
          | ID { $$.push_back($1); }
          ;

%%

void parser_tptp::parser_tptp::error (const location_type& l, const std::string& m)
{
  std::cerr << l << ": " << m << '\n';
}
