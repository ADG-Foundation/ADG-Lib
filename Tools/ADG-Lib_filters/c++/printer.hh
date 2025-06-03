#ifndef __PRINTER_HH__
#define __PRINTER_HH__

#include "expression.hh"

class Printer : public ExpressionVisitor {
public:
  Printer(std::ostream& ostr, const std::string& conjectureName) :
    ostr_(ostr), conjectureName_(conjectureName) {
  }

  virtual void printHeader() { }
  virtual void printFooter() { }
  
protected:
  std::ostream& ostr_;
  std::string conjectureName_;
};

#endif
