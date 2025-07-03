#ifndef __PRINTER_GCL__
#define __PRINTER_GCL__

#include "printer.hh"

// used for better layout
enum command_type {
  eFreePoint,
  eDrawing,
  eLabeling,
  eOther
};

class PrinterGCL : public Printer {
public:
  PrinterGCL(std::ostream& ostr, const std::string& conjectureName) : Printer(ostr, conjectureName) {
     prevCommand = eOther;
  }

  void printHeader() override {
  }
  
  void printConjectures(const std::vector<ExprPtr>& conjectures) {
    printingConjectures_ = true;
    for (ExprPtr c : conjectures)
      c->acceptVisitor(*this);
    ostr_ << std::endl << std::endl;    
  }

  void printComment(const std::string& comment) {
    ostr_ << "% " << comment << std::endl;
  }

  void visitConstant(const Constant&) override; 
  void visitVariable(const Variable&) override; 
  void visitNaryExpression(const NaryExpression&) override;

  void visitFreePoint(const FreePoint&) override;
  void visitLine(const Line&) override;
  void visitCircle(const Circle&) override;    
  
  void visitDrawPoint(const DrawPoint&) override;
  void visitDrawSegment(const DrawSegment&) override;
  void visitDrawLine(const DrawLine&) override;
  void visitDrawLine_P(const DrawLine_P&) override;
  void visitDrawCircle(const DrawCircle&) override;
  void visitDrawCircle_P(const DrawCircle_P&) override;
  void visitLabelPoint(const LabelPoint&) override;
  
  void visitFunTowards(const FunTowards&) override;
  void visitFunFoot(const FunFoot&) override;
  void visitFunMidpoint(const FunMidpoint&) override;
  void visitFunSegmentBisector(const FunSegmentBisector&) override;
  void visitFunParallel(const FunParallel&) override;
  void visitFunPerpendicular(const FunPerpendicular&) override;
  void visitFunPerpendicular_P(const FunPerpendicular_P&) override;
  void visitFunTranslate(const FunTranslate&) override;
  void visitFunIntersectLL(const FunIntersectLL&) override;
  void visitFunIntersectLL_P(const FunIntersectLL_P&) override;
  void visitFunIntersectLC(const FunIntersectLC&) override;
  void visitFunIntersectLC_P(const FunIntersectLC_P&) override;
  void visitFunIntersectCC(const FunIntersectCC&) override;
  void visitFunIntersectCC_P(const FunIntersectCC_P&) override;

  void visitTowards(const Towards&) override;
  void visitFoot(const Foot&) override;
  void visitFoot_P(const Foot_P&) override;
  void visitMidpoint(const Midpoint&) override;
  void visitParallel_P(const Parallel_P& e) override;
  void visitParallelDG_P(const ParallelDG_P& e) override;
  void visitPerpendicular_P(const Perpendicular_P& e) override;
  void visitPerpendicularDG_P(const PerpendicularDG_P& e) override;
  void visitCongruent(const Congruent& e) override;
  void visitCollinear(const Collinear& e) override; 
  void visitEqual(const Equal& e) override;
  void visitIdentical(const Identical& e) override;
  void visitAlgSum3(const AlgSum3& e) override;  
  void visitHarmonic(const Harmonic& e) override;
  
  void visitOnLine_P(const OnLine_P&) override;
  void visitOnCircle_P(const OnCircle_P&) override;      
  void visitOnParallel_P(const OnParallel_P&) override;  
  void visitOnPerpendicular_P(const OnPerpendicular_P&) override;

  void visitTriangle(const Triangle&) override;
  
private:
  void printNewLineIfNeeded(enum command_type c);
  enum command_type prevCommand;
};

#endif


