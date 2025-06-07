#ifndef __PRINTER_GGB_HH__
#define __PRINTER_GGB_HH__

#include "printer.hh"
#include <fstream>
#include <filesystem>
#include <zip.h>

const std::string GEOGEBRA_XML = "geogebra.xml";

class PrinterGGB : public Printer {
public:
  
  PrinterGGB(const std::string& conjectureName, bool zipOutput) :
    Printer([&]() -> std::ostream& {
              if (zipOutput) {
                if (std::filesystem::exists(GEOGEBRA_XML))
                  throw std::string("The file ") + GEOGEBRA_XML + std::string(" exists, remove it first");
                return gxml_;
              } else {
                return std::cout;
              }
            }(), conjectureName), zipOutput_(zipOutput) {
    if (zipOutput)
      gxml_.open(GEOGEBRA_XML, std::ios::out | std::ios::trunc);
              
  }

  void printHeader() override;
  void printFooter() override;

  void visitConstant(const Constant&) override; 
  void visitVariable(const Variable&) override; 
  void visitNaryExpression(const NaryExpression&) override;

  void visitFreePoint(const FreePoint&) override;
  void visitLine(const Line&) override;

  void visitDrawPoint(const DrawPoint&) override;
  void visitDrawSegment(const DrawSegment&) override;
  void visitDrawLine(const DrawLine&) override;
  void visitDrawLine_P(const DrawLine_P&) override;
  void visitLabelPoint(const LabelPoint&) override;
  
  void visitFunMidpoint(const FunMidpoint&) override;
  void visitFunSegmentBisector(const FunSegmentBisector&) override;
  void visitFunParallel(const FunParallel&) override;
  void visitFunPerpendicular(const FunPerpendicular&) override;
  void visitFunIntersectLL(const FunIntersectLL&) override;
  void visitFunIntersectLL_P(const FunIntersectLL_P& e) override;  

  void visitOnLine(const OnLine&) override;
  void visitOnParallel(const OnParallel&) override;
  void visitOnPerpendicular(const OnPerpendicular&) override;

  void visitMidpoint(const Midpoint&) override {
    throw std::string("Predicates are not supported");
  }

  void visitParallel_P(const Parallel_P& e) override;
  
  void visitParallelDG_P(const ParallelDG_P& e) override {
    throw std::string("Predicate paralleldg should have been eliminated");
  }
  
  void visitPerpendicular_P(const Perpendicular_P& e) override;

  void visitPerpendicularDG_P(const PerpendicularDG_P& e) override {
    throw std::string("Predicate perpendiculardg should have been eliminated");
  }

  void visitCollinear(const Collinear& e) override;

  void visitEqual(const Equal& e) override;
  void visitIdentical(const Identical& e) override {
      throw std::string("Predicates are not supported");
  }

  void visitHarmonic(const Harmonic& e) override;
  void visitCongruent(const Congruent& e) override {
      throw std::string("Predicates are not supported");
  }

  void postprocess() override {
    if (zipOutput_) {
      gxml_.close();
      createZipArchive(conjectureName_ + ".ggb", GEOGEBRA_XML);
      std::filesystem::remove(GEOGEBRA_XML);
    }
  }

private:
  void createZipArchive(const std::string& archivePath, const std::string& fileName) {
    // Get error object
    zip_error_t zerr;
    zip_error_init(&zerr);

    int err = 0;
    zip_t* archive = zip_open(archivePath.c_str(), ZIP_CREATE | ZIP_TRUNCATE, &err);
    if (!archive) {
      zip_error_t tempErr;
      zip_error_init_with_code(&tempErr, err);
      std::cerr << "Error opening archive '" << archivePath << "': " << zip_error_strerror(&tempErr) << std::endl;
      zip_error_fini(&tempErr);
      return;
    }

    // Wrap archive in unique_ptr with custom deleter
    std::unique_ptr<zip_t, decltype(&zip_close)> archivePtr(archive, zip_close);

    // Create a zip source
    zip_source_t* source = zip_source_file_create(fileName.c_str(), 0, -1, &zerr);
    if (!source) {
      std::cerr << "Error creating zip source: " << zip_error_strerror(&zerr) << std::endl;
      zip_error_fini(&zerr);
      return;
    }

    // Add file to archive
    zip_int64_t index = zip_file_add(archive, fileName.c_str(), source, ZIP_FL_ENC_UTF_8);
    if (index < 0) {
      std::cerr << "Error adding file to archive: " << zip_strerror(archive) << std::endl;
      zip_source_free(source);  // clean up if not added
      return;
    }
  }
  
  bool zipOutput_;
  std::ofstream gxml_;
};


#endif
