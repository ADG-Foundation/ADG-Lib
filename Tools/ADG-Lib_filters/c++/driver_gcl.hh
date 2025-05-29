#ifndef __DRIVER_GCL_HH__
#define __DRIVER_GCL_HH__

#include <string>
#include <map>
#include <vector>
#include "parser_gcl.hh"
#include "expression.hh"

class driver_gcl
{
public:
  driver_gcl();

  std::vector<std::string> points;
  std::map<std::string, Line> lines;
  std::vector<ExprPtr> hypotheses;
  std::vector<ExprPtr> conjectures;
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
  parser_gcl::location location;
};  


#endif
