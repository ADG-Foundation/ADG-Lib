#ifndef __PRINTER_TPTP_HH__
#define __PRINTER_TPTP_HH__

#include "printer.hh"

class PrinterTPTP : public Printer {
public:
  PrinterTPTP(std::ostream& ostr, const std::string& conjectureName) : Printer(ostr, conjectureName) {
  }
  
  void visitConstant(const Constant&) override; 
  void visitVariable(const Variable&) override; 
  void visitNaryExpression(const NaryExpression&) override;

  void visitFreePoint(const FreePoint&) override;
  void visitLine(const Line&) override;
  
  void visitDrawPoint(const DrawPoint&) override;
  void visitDrawSegment(const DrawSegment&) override;
  
  void visitFunMidpoint(const FunMidpoint&) override;
  void visitFunSegmentBisector(const FunSegmentBisector&) override;
  void visitFunParallel(const FunParallel&) override;
  void visitFunPerpendicular(const FunPerpendicular&) override;
  void visitFunIntersectLL(const FunIntersectLL&) override;
  void visitFunIntersectLL_P(const FunIntersectLL_P& e) override;  

  void visitMidpoint(const Midpoint& e) override;
  
  void visitOnParallel(const OnParallel&) override;
  void visitOnPerpendicular(const OnPerpendicular&) override;
};

#endif
