#include <iostream>
#include <vector>
#include "driver_jgex.hh"
#include "driver_gcl.hh"

#include "eliminate_lines.hh"

// TODO: replace with <filesystem> once it becomes stable
std::string getFilenameStem(const std::string& path) {
  size_t slash = path.find_last_of("/\\");
  size_t dot = path.find_last_of('.');
  size_t start = (slash == std::string::npos) ? 0 : slash + 1;
  if (dot == std::string::npos || dot < start)
    return path.substr(start);
  return path.substr(start, dot - start);
}

void print_tptp(const std::string& conjectureName,
                std::vector<std::string>& points,
                const std::map<std::string, Line> lines,
                const std::vector<ExprPtr>& hypotheses,
                const std::vector<ExprPtr>& conjectures) {
  std::cout << "%% " << conjectureName << "\n" << std::endl;
  std::cout << "%%----Include Geometry Deductive Database Method axioms" << std::endl;
  std::cout << "include('geometryDeductiveDatabaseMethod.ax')." << std::endl << std::endl;
  std::cout << "fof(tgtp" << conjectureName << ",conjecture,(";

  EliminateLinesTransformer eliminate_lines;
  eliminate_lines.addLines(lines);
  std::vector<ExprPtr> transformed_hypotheses(hypotheses.size());
  for (int i = 0; i < hypotheses.size(); i++)
    transformed_hypotheses[i] = hypotheses[i]->acceptTransformer(eliminate_lines);
  points.insert(points.end(), eliminate_lines.auxiliaryPoints().begin(), eliminate_lines.auxiliaryPoints().end());

  // quantify over all points
  if (points.size() > 0) {
    std::cout << "! [";
    std::cout << points[0];
    for (int i = 1; i < points.size(); i++)
      std::cout << "," << points[i];
    std::cout << "] : " << std::endl;
  }

  // hypotheses
  if (transformed_hypotheses.size() > 0) {
    std::cout << "\t\t(" << std::endl;
    std::cout << "\t\t "; transformed_hypotheses[0]->print(std::cout);
    for (int i = 1; i < transformed_hypotheses.size(); i++) {
      std::cout << " &" << std::endl;
      std::cout << "\t\t "; transformed_hypotheses[i]->print(std::cout);
    }
    std::cout << std::endl;
    std::cout << "\t\t)" << std::endl;
    std::cout << "\t\t=>" << std::endl;
  }

  // Conjectures
  std::cout << "\t\t(" << std::endl;
  std::cout << "\t\t "; conjectures[0]->print(std::cout);
  for (int i = 1; i < conjectures.size(); i++) {
    std::cout << " &" << std::endl;
    std::cout << "\t\t "; conjectures[i]->print(std::cout);
  }

  std::cout << std::endl;
  std::cout << "\t\t)" << std::endl;
  
  std::cout << "\t)" << std::endl;
  std::cout << ")." << std::endl;
}

inline bool ends_with(std::string const & value, std::string const & ending)
{
    if (ending.size() > value.size()) return false;
    return std::equal(ending.rbegin(), ending.rend(), value.rbegin());
}

int process_file(const std::string& file_name, driver& drv, bool trace_scanning, bool trace_parsing) {
  drv.trace_scanning = trace_scanning;
  drv.trace_parsing = trace_parsing;

  int parse_result = drv.parse(file_name);
  if (parse_result != 0)
    return 1;
  else {
    if (drv.conjectures.size() == 0) {
      std::cerr << "Error: no conjectures found" << std::endl;
    } else {
      std::string conjectureName = getFilenameStem(file_name);
      print_tptp(conjectureName, drv.points, drv.lines, drv.hypotheses, drv.conjectures);
    }
    return 0;
  }
}
                

int main (int argc, char *argv[])
{
  try {
  int result = 0;
  bool trace_parsing = false;
  bool trace_scanning = false;
  for (int i = 1; i < argc; ++i) {
    std::cout << argv[i] << std::endl;
    if (std::string(argv[i]) == "-p")
      trace_parsing = true;
    else if (std::string(argv[i]) == "-s") {
      trace_scanning = true;
    } else {
      std::string file_name{argv[i]};
      if (ends_with(file_name, ".gcl")) {
        driver_gcl drv;
        if (process_file(argv[i], drv, trace_scanning, trace_parsing) == 1)
          result = 1;
      } else if (ends_with(file_name, ".jgex") || ends_with(file_name, ".gex")) {
        driver_jgex drv;
        if (process_file(argv[i], drv, trace_scanning, trace_parsing) == 1)
          result = 1;
      } else {
        std::cerr << "Unknow extension " << argv[i] << std::endl;
      }
    }
  }
  return result;
  } catch (const std::string& message) {
    std::cerr << message << std::endl;
  }
}
