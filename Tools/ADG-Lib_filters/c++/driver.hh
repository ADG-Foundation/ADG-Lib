#ifndef __DRIVER_HH__
#define __DRIVER_HH__

#include <string>
#include <map>
#include <vector>
#include "parser_gcl.hh"
#include "expression.hh"

// Give Flex the prototype of yylex we want ...
#define YY_DECL \
  yy::parser::symbol_type yylex (driver& drv)
// ... and declare it for the parser's sake.
YY_DECL;

struct Line {
  std::string id;
  std::string points[2];
  Line(const std::string& id, const std::string& point1, const std::string& point2) {
    this->id = id;
    this->points[0] = point1;
    this->points[1] = point2;
  }
};

class AuxiliaryPoints {
private:
  // Private constructor
  AuxiliaryPoints() = default;
  
  int num = 0;
  
public:
  // Delete copy constructor and assignment to enforce singleton
  AuxiliaryPoints(const AuxiliaryPoints&) = delete;
  AuxiliaryPoints& operator=(const AuxiliaryPoints&) = delete;
  
  static std::string get() {
    static AuxiliaryPoints instance;
    return "X" + std::to_string(instance.num++);
  }
};


class driver
{
public:
  driver();

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
  yy::location location;
};  


#endif
