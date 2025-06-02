#ifndef __PRINTER_GGB_HH__
#define __PRINTER_GGB_HH__

#include "expression.hh"

class PrinterGGB : public ExpressionVisitor {
public:
  PrinterGGB(std::ostream& ostr) : ostr_(ostr) {
  }
  
  void visitConstant(const Constant&) override; 
  void visitVariable(const Variable&) override; 
  void visitNaryExpression(const NaryExpression&) override;

  void visitFreePoint(const FreePoint&) override;
  void visitLine(const Line&) override;
  
  void visitDrawPoint(const DrawPoint&) override;
  void visitDrawSegment(const DrawSegment&) override;
  void visitFunMidpoint(const FunMidpoint&) override;
  void visitFunParallel(const FunParallel&) override;
  void visitFunIntersectLL(const FunIntersectLL&) override;
  void visitFunIntersectLL_P(const FunIntersectLL_P& e) override;

  void visitOnParallel(const OnParallel&) override;

private:
  std::ostream& ostr_;
};


#endif
