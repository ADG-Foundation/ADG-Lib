#ifndef __DRIVER_HH__
#define __DRIVER_HH__

#include <string>
#include <map>
#include <vector>
#include "expression.hh"

class driver
{
public:
  driver();
  virtual ~driver() = default;

  // run the parser on the file
  // return 0 on success
  int parse(const std::string& file_name);

  // this depends on the specific parser used
  virtual int do_parse() = 0;
  
  // the name of the file being parsed
  std::string file_name;
  // whether to generate parser debug traces
  bool trace_parsing;
  
  // Handling the scanner.
  virtual void scan_begin() = 0;
  virtual void scan_end() = 0;
  // Whether to generate scanner debug traces.
  bool trace_scanning;


  // information collected during parsing
  std::vector<Point> points;
  std::map<std::string, Line> lines;
  std::map<std::string, Circle> circles;  
  std::vector<ExprPtr> hypotheses;
  std::vector<ExprPtr> conjectures;
};  


#endif
