#ifndef __DRIVER_JGEX_HH__
#define __DRIVER_JGEX_HH__

#include <string>
#include <map>
#include <vector>
#include "parser_jgex.hh"
#include "expression.hh"

class driver_jgex
{
public:
  driver_jgex();

  std::vector<std::string> points;
  std::map<std::string, Line> lines;
  std::vector<ExprPtr> hypotheses;
  std::vector<ExprPtr> conjectures;
  bool show = false; // mode that switches from hypotheses to conjectures
  int result;

  // run the parser on the file
  // return 0 on success
  int parse(const std::string& file_name);
  // the name of the file being parsed
  std::string file_name;
  // whether to generate parser debug traces
  bool trace_parsing;
  
  // Handling the scanner.
  void scan_begin();
  void scan_end();
  // Whether to generate scanner debug traces.
  bool trace_scanning;
  // The token's location used by the scanner.
  parser_jgex::location location;
};  


#endif
