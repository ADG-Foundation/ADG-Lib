#ifndef __PRINTER_TPTP_HH__
#define __PRINTER_TPTP_HH__

#include <sstream>

#include "printer.hh"

class PrinterTPTP : public Printer {
public:
  PrinterTPTP(std::ostream& ostr, const std::string& conjectureName) : Printer(ostr, conjectureName) {
  }

  void printHeader() override {
    ostr_ << "%----Include appropriate geometry axioms" << std::endl;
    ostr_ << "include('geometry.ax')." << std::endl;
    ostr_ << "fof(" << conjectureName_ << ", conjecture, (" << std::endl;    
  }

  void printFooter() override {
    ostr_ << ")))." << std::endl;
  }

  void printComment(const std::string& comment) override {
    ostr_ << "% " << comment << std::endl;
  }
  
  void printQuantifiers(const std::vector<Point>& points) override {
    if (points.empty()) return;
    ostr_ << "! [";
    ostr_ << points[0].id();
    for (int i = 1; i < points.size(); i++)
      ostr_ << ", " << points[i].id();
    ostr_ << "]:" << std::endl;
  }
  
  // TODO: Be carefull about the top level connectives
  void printHypotheses(const std::vector<ExprPtr>& hypotheses) override {
    conjuncts_.clear();
    ostr_ << "(";    
    for (ExprPtr h : hypotheses)
      h->acceptVisitor(*this);
    if (conjuncts_.empty())
      ostr_ << "true";
    else
      printConjuncts("&");
  }

  void printConjectures(const std::vector<ExprPtr>& conjectures) override {
    conjuncts_.clear();
    ostr_ << std::endl << " => " << std::endl;
    
    for (ExprPtr c : conjectures)
      c->acceptVisitor(*this);

    if (conjuncts_.empty())
      ostr_ << "true";
    else
      printConjuncts("|");
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

  void visitTowards(const Towards&) override;
  void visitFoot(const Foot&) override;
  void visitMidpoint(const Midpoint&) override;
  void visitParallel_P(const Parallel_P& e) override;
  void visitParallelDG_P(const ParallelDG_P& e) override;
  void visitPerpendicular_P(const Perpendicular_P& e) override;
  void visitPerpendicularDG_P(const PerpendicularDG_P& e) override;
  void visitFoot_P(const Foot_P& e) override;
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
  void printConjuncts(const std::string& separator) const {
    ostr_ << "(";
    ostr_ << conjuncts_[0];
    for (int i = 1; i < conjuncts_.size(); i++)
      ostr_ << " " << separator << std::endl << conjuncts_[i];
    ostr_ << ")";
  }

  std::ostringstream current_;
  std::vector<std::string> conjuncts_;
};

#endif
