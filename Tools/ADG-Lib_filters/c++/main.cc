#include <iostream>
#include <vector>
#include "driver_jgex.hh"
#include "driver_gcl.hh"

#include "printer_gcl.hh"
#include "printer_ggb.hh"
#include "printer_argodg.hh"
#include "printer_tptp.hh"

#include "eliminate_lines.hh"
#include "eliminate_functions.hh"

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

int process_file(const std::string& fileName, driver& drv,
                 bool traceScanning, bool traceParsing,
                 bool eliminateLines, bool eliminateFunctions, Format outputFormat) {
  drv.trace_scanning = traceScanning;
  drv.trace_parsing = traceParsing;
  int parseResult = drv.parse(fileName);
  if (parseResult != 0)
    return 1;
  else {
    if (drv.conjectures.size() == 0) {
      std::cerr << "Error: no conjectures found" << std::endl;
      return 1;
    }

    std::vector<ExprPtr> hypotheses(drv.hypotheses);
    std::vector<ExprPtr> conjectures(drv.conjectures);
    std::vector<FreePoint> points(drv.points);
    std::map<std::string, Line> lines(drv.lines);

    if (eliminateLines) {
      // lines elimination
      EliminateLinesTransformer transformer;
      transformer.addLines(lines);
      
      std::vector<ExprPtr> hypothesesNoLines;
      hypothesesNoLines.reserve(hypotheses.size());
      for (int i = 0; i < hypotheses.size(); i++) {
        ExprPtr e = hypotheses[i]->acceptTransformer(transformer);
        if (e != nullptr)
          hypothesesNoLines.push_back(e);
      }
      hypotheses = hypothesesNoLines;

      std::vector<ExprPtr> conjecturesNoLines;
      conjecturesNoLines.reserve(conjectures.size());
      for (int i = 0; i < conjectures.size(); i++) {
        ExprPtr e = conjectures[i]->acceptTransformer(transformer);
        if (e != nullptr)
          conjecturesNoLines.push_back(e);
      }
      conjectures = conjecturesNoLines;
      points.insert(points.end(), transformer.auxiliaryPoints().begin(), transformer.auxiliaryPoints().end());
      lines = transformer.lines();
    }

    if (eliminateFunctions) {
      // functions elimination
      std::vector<ExprPtr> hypothesesNoFunctions;
      hypothesesNoFunctions.reserve(hypotheses.size());
      
      EliminateFunctionsTransformer transformer;
      for (int i = 0; i < hypotheses.size(); i++) {
        ExprPtr e = hypotheses[i]->acceptTransformer(transformer);
        if (e != nullptr) 
          hypothesesNoFunctions.push_back(e);
      }
      hypotheses = hypothesesNoFunctions;
    }

    // print in the chosen format
      
    std::string conjectureName = getFilenameStem(fileName);

    std::unique_ptr<Printer> printer;      
    if (outputFormat == ArgoDG)
      printer = std::make_unique<PrinterArgoDG>(std::cout, conjectureName);
    else if (outputFormat == GCL)
      printer = std::make_unique<PrinterGCL>(std::cout, conjectureName);
    else if (outputFormat == GGB)
      printer = std::make_unique<PrinterGGB>(std::cout, conjectureName);
    else if (outputFormat == TPTP)
      printer = std::make_unique<PrinterTPTP>(std::cout, conjectureName);

    printer->printComment(std::string("generated from ") + conjectureName + std::string(" using ADG-Lib tools"));
    printer->printHeader();
    printer->printHypotheses(hypotheses);
    printer->printConjectures(conjectures);
    printer->printFooter();
  }
  return 0;
}


int main (int argc, char *argv[])
{
  try {
    std::vector<std::string> inputFiles;
    int result = 0;
    bool trace_parsing = false;
    bool trace_scanning = false;
    bool eliminate_lines = false;
    bool eliminate_functions = false;

    Format outputFormat = UNKNOWN;
    
    for (int i = 1; i < argc; ++i) {
      std::string arg(argv[i]);
      if (arg == "-p")
        trace_parsing = true;
      else if (arg == "-s") {
        trace_scanning = true;
      } else if (arg == "-o") {
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
            outputFormat = TPTP;
          } else {
            std::cerr << "output format " << format_str << " unknown" << std::endl;
          }
          i++;
        } else {
          std::cerr << "format must be specified after -o" << std::endl;
        }
      } else if (arg == "-el") {
        eliminate_lines = true;
      } else if (arg == "-ef") {
        eliminate_functions = true;
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
        if (process_file(fileName, drv, trace_scanning, trace_parsing, eliminate_lines, eliminate_functions, outputFormat) == 1)
          result = 1;
      } else if (ends_with(fileName, ".jgex") || ends_with(fileName, ".gex")) {
        driver_jgex drv;
        if (process_file(fileName, drv, trace_scanning, trace_parsing, eliminate_lines, eliminate_functions, outputFormat) == 1)
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
