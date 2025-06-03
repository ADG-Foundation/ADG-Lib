#include <iostream>
#include <vector>
#include "driver_jgex.hh"
#include "driver_gcl.hh"
#include "printer_gcl.hh"
#include "printer_ggb.hh"
#include "printer_argodg.hh"

#include "eliminate_lines.hh"

enum Format {UNKNOWN = -1, GCL, JGEX, GGB, ArgoDG, TPTP};

// TODO:
// add flags for options
//    - eliminate lines
//    - eliminate functions
//    - check syntax
//    - guess syntax
//    - declaration to procedural
//    - compare two files
//    - ...

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
                std::vector<FreePoint>& points,
                const std::map<std::string, Line> lines,
                const std::vector<ExprPtr>& hypotheses,
                const std::vector<ExprPtr>& conjectures) {
  std::cout << "%% " << conjectureName << "\n" << std::endl;
  std::cout << "%%----Include Geometry Deductive Database Method axioms" << std::endl;
  std::cout << "include('geometryDeductiveDatabaseMethod.ax')." << std::endl << std::endl;
  std::cout << "fof(tgtp" << conjectureName << ",conjecture,(";

  // quantify over all points
  if (points.size() > 0) {
    std::cout << "! [";
    std::cout << points[0].id();
    for (int i = 1; i < points.size(); i++)
      std::cout << "," << points[i].id();
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


inline bool ends_with(std::string const & value, std::string const & ending)
{
    if (ending.size() > value.size()) return false;
    return std::equal(ending.rbegin(), ending.rend(), value.rbegin());
}

int process_file(const std::string& fileName, driver& drv, bool trace_scanning, bool trace_parsing, Format outputFormat) {
  drv.trace_scanning = trace_scanning;
  drv.trace_parsing = trace_parsing;

  int parse_result = drv.parse(fileName);
  if (parse_result != 0)
    return 1;
  else {
    if (drv.conjectures.size() == 0) {
      std::cerr << "Error: no conjectures found" << std::endl;
    } else {
      EliminateLinesTransformer eliminate_lines;
      eliminate_lines.addLines(drv.lines);
      std::vector<ExprPtr> transformed_hypotheses;
      transformed_hypotheses.reserve(drv.hypotheses.size());
      for (int i = 0; i < drv.hypotheses.size(); i++) {
        ExprPtr e = drv.hypotheses[i]->acceptTransformer(eliminate_lines);
        if (e != nullptr)
          transformed_hypotheses.push_back(e);
      }
      drv.points.insert(drv.points.end(), eliminate_lines.auxiliaryPoints().begin(), eliminate_lines.auxiliaryPoints().end());
      
      std::string conjectureName = getFilenameStem(fileName);

      PrinterGCL printerGCL(std::cout, conjectureName);
      PrinterGGB printerGGB(std::cout, conjectureName);
      PrinterArgoDG printerArgoDG(std::cout, conjectureName);

      Printer* printer;
      
      if (outputFormat == ArgoDG)
        printer = &printerArgoDG;
      else if (outputFormat == GCL)
        printer = &printerGCL;
      else if (outputFormat == GGB)
        printer = &printerGGB;

      printer->printHeader();
      for (ExprPtr h : transformed_hypotheses)
        h->acceptVisitor(*printer);
      printer->printFooter();
      
    }
    return 0;
  }
}


int main (int argc, char *argv[])
{
  try {
    std::vector<std::string> inputFiles;
    int result = 0;
    bool trace_parsing = false;
    bool trace_scanning = false;

    Format outputFormat = UNKNOWN;
    
    for (int i = 1; i < argc; ++i) {
      if (std::string(argv[i]) == "-p")
        trace_parsing = true;
      else if (std::string(argv[i]) == "-s") {
        trace_scanning = true;
      } else if (std::string(argv[i]) == "-o") {
        if (i + 1 < argc) {
          std::string format_str{argv[i+1]};
          if (format_str == "gcl") {
            outputFormat = GCL;
          } else if (format_str == "jgex" || format_str == "gex") {
            outputFormat = JGEX;
          } else if (format_str == "ggb") {
            outputFormat = GGB;
          } else if (format_str == "argodg") {
            outputFormat = ArgoDG;
          } else if (format_str == "tptp") {
            outputFormat == TPTP;
          } else {
            std::cerr << "output format " << format_str << " unknown" << std::endl;
          }
          i++;
        } else {
          std::cerr << "format must be specified after -o" << std::endl;
        }
      } else {
        inputFiles.push_back(argv[i]);
      }
    }

    if (outputFormat == UNKNOWN) {
      std::cerr << "output format must be set (-o format)" << std::endl;
      return 1;
    }

    for (const std::string& fileName : inputFiles) {
      if (ends_with(fileName, ".gcl")) {
        driver_gcl drv;
        if (process_file(fileName, drv, trace_scanning, trace_parsing, outputFormat) == 1)
          result = 1;
      } else if (ends_with(fileName, ".jgex") || ends_with(fileName, ".gex")) {
        driver_jgex drv;
        if (process_file(fileName, drv, trace_scanning, trace_parsing, outputFormat) == 1)
          result = 1;
      } else {
        std::cerr << "Unknown input format extension " << fileName << std::endl;
      }
    }
    
    return result;
  } catch (const std::string& message) {
    std::cerr << message << std::endl;
  }
}
