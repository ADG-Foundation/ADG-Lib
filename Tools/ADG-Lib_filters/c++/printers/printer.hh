#ifndef __PRINTER_HH__
#define __PRINTER_HH__

#include "expression.hh"

class Printer : public ExpressionVisitor {
public:
  Printer(std::ostream& ostr, const std::string& conjectureName) :
    ostr_(ostr), conjectureName_(conjectureName), printingConjectures_(false) {
  }

  virtual void printHeader() { }
  virtual void printFooter() { }

  virtual void printComment(const std::string& comment) {
    // by default, comments are ignored
  }

  virtual void printQuantifiers(const std::vector<Point>& points) {
  }
  
  virtual void printHypotheses(const std::vector<ExprPtr>& hypotheses) {
    for (ExprPtr h : hypotheses)
      h->acceptVisitor(*this);
  }
  
  virtual void printConjectures(const std::vector<ExprPtr>& conjectures) {
    printingConjectures_ = true;
    for (ExprPtr c : conjectures)
      c->acceptVisitor(*this);
    ostr_ << std::endl;  
  }

  virtual void postprocess() {
  }
  
protected:
  std::ostream& ostr_;
  std::string conjectureName_;
  bool printingConjectures_;
};

#endif
