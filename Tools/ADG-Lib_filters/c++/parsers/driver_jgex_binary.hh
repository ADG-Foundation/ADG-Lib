#ifndef __PARSER_JGEX_BINARY_HH__
#define __PARSER_JGEX_BINARY_HH__

#include <map>

#include "driver.hh"

struct Parameter {
  int type;
  int xindex;
  double value;
  bool Solved;
};

struct Coords {
  Coords (double x, double y) : x(x), y(y) {}
  double x, y;
};


struct CClass {
  int m_id;
  std::string m_name;
  int m_color, m_dash, m_width;
  bool visible;
};


class driver_jgex_binary : public driver {
public:
  int do_parse() override;

  void scan_begin() override { }
  void scan_end() override { }

private:
  void drawData_Load(std::ifstream& in);
  void Load_global(std::ifstream& in);
  
  const Parameter& getParameterByindex(double index);
  void Parameter_Load(std::ifstream& in, Parameter& p);
  void CTrace_Load(std::ifstream& in);
  void CClass_Load(std::ifstream& in, CClass& c);
  void DrawType_Load(std::ifstream& in);
  void CPoint_Load(std::ifstream& in);
  void CLine_Load(std::ifstream& in);
  void Circle_Load(std::ifstream& in);
  void CAngle_Load(std::ifstream& in);
  void CText_Load(std::ifstream& in);
  void CTMark_Load(std::ifstream& in);
  void Arrow_Load(std::ifstream& in);
  void Cedmark_Load(std::ifstream& in);
  void Constraint_Load(std::ifstream& in);
  void UndoStruct_Load(std::ifstream& in);
  bool Load(std::ifstream& in);
    
  int paraCounter;
  std::vector<Parameter> parameters;
  std::map<std::string, Coords> points;
};

#endif
