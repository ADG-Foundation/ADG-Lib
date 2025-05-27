#include <iostream>
#include <vector>
#include "driver.hh"

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
                const std::vector<std::string>& points,
                const std::vector<ExprPtr>& hypotheses,
                const std::vector<ExprPtr>& conjectures) {
  std::cout << "%% " << conjectureName << "\n" << std::endl;
  std::cout << "%%----Include Geometry Deductive Database Method axioms" << std::endl;
  std::cout << "include('geometryDeductiveDatabaseMethod.ax')." << std::endl << std::endl;
  std::cout << "fof(tgtp" << conjectureName << ",conjecture,(";
  
  // quantify over all points
  if (points.size() > 0) {
    std::cout << "! [";
    std::cout << points[0];
    for (int i = 1; i < points.size(); i++)
      std::cout << "," << points[i];
    std::cout << "] : " << std::endl;
  }

  // hypotheses
  if (hypotheses.size() > 0) {
    std::cout << "\t\t(" << std::endl;
    std::cout << "\t\t "; hypotheses[0]->print(std::cout);
    for (int i = 1; i < hypotheses.size(); i++) {
      std::cout << " &" << std::endl;
      std::cout << "\t\t "; hypotheses[i]->print(std::cout);
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
                
                

int main (int argc, char *argv[])
{
  int result = 0;
  driver drv;
  for (int i = 1; i < argc; ++i) {
    if (argv[i] == std::string ("-p"))
      drv.trace_parsing = true;
    else if (argv[i] == std::string ("-s"))
      drv.trace_scanning = true;
    else {
      int parse_result = drv.parse(argv[i]);
      if (parse_result != 0)
        result = 1;
      else {
        if (drv.conjectures.size() == 0) {
          std::cerr << "Error: no conjectures found" << std::endl;
        } else {
          std::string conjectureName = getFilenameStem(argv[i]);
          print_tptp(conjectureName, drv.points, drv.hypotheses, drv.conjectures);
        }
      }
    }
  }
  return result;
}
