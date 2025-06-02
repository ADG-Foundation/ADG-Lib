#ifndef __PRINTER_GGB_HH__
#define __PRINTER_GGB_HH__

#include "expression.hh"

class PrinterGGB : public ExpressionVisitor {
public:
  PrinterGGB(std::ostream& ostr) : ostr_(ostr) {
  }
  
  void visitConstant(const Constant&); 
  void visitVariable(const Variable&); 
  void visitNaryExpression(const NaryExpression&);

  void visitDrawPoint(const DrawPoint&);
  void visitDrawSegment(const DrawSegment&);
  void visitFunMidpoint(const FunMidpoint&);
  void visitFunParallel(const FunParallel&);
  void visitFunIntersectLL(const FunIntersectLL&);

private:
  std::ostream& ostr_;
};


#endif
