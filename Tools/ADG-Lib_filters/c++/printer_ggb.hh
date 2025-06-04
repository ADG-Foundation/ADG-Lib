#ifndef __PRINTER_GGB_HH__
#define __PRINTER_GGB_HH__

#include "printer.hh"

class PrinterGGB : public Printer {
public:
  PrinterGGB(std::ostream& ostr, const std::string& conjectureName) : Printer(ostr, conjectureName) {
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

  void visitPerpendicular_P(const Perpendicular_P& e) override;

  void visitCollinear(const Collinear& e) override;

  void visitCongruent(const Congruent& e) override {
      throw std::string("Predicates are not supported");
  }
  
  
};


#endif
