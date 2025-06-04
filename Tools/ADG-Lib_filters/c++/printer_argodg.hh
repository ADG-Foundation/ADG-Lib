#ifndef __PRINTER_ARGO_DG_HH__
#define __PRINTER_ARGO_DG_HH__

#include "printer.hh"

class PrinterArgoDG : public Printer {
public:
  PrinterArgoDG(std::ostream& ostr, const std::string& conjectureName) : Printer(ostr, conjectureName) {
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
  void visitFunIntersectLL_P(const FunIntersectLL_P&) override;

  void visitMidpoint(const Midpoint&) override {
    // throw std::string("Predicates are not supported");
  }

  void visitParallel_P(const Parallel_P& e) override {
    // throw std::string("Predicates are not supported");
  }

  void visitPerpendicular_P(const Perpendicular_P& e) override {
    // throw std::string("Predicates are not supported");
  }

  void visitCongruent(const Congruent& e) override {
    // throw std::string("Predicates are not supported");
  }
  
  void visitCollinear(const Collinear& e) override {
    // throw std::string("Predicates are not supported");
  }
  
  void visitOnLine(const OnLine&) override;  
  void visitOnParallel(const OnParallel&) override;  
  void visitOnPerpendicular(const OnPerpendicular&) override;  
};


#endif
