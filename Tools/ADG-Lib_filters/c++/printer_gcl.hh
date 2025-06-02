#ifndef __PRINTER_GCL__
#define __PRINTER_GCL__

#include "expression.hh"

class PrinterGCL : public ExpressionVisitor {
public:
  PrinterGCL(std::ostream& ostr) : ostr_(ostr) {
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
  void visitFunIntersectLL_P(const FunIntersectLL_P&) override;

  void visitOnParallel(const OnParallel&) override;
  
private:
  std::ostream& ostr_;
};

#endif

