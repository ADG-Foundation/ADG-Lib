#include "printer_gcl.hh"

void PrinterGCL::visitConstant(const Constant&) {
}

void PrinterGCL::visitVariable(const Variable& v) {
  ostr_ << v.name();
}

void PrinterGCL::visitNaryExpression(const NaryExpression& e) {
  if (e.op() == "&") {
    for (ExprPtr operand : e.operands())
      operand->acceptVisitor(*this);
  }
}

void PrinterGCL::visitFreePoint(const FreePoint& p) {
  ostr_ << "point " << p.id() << " " << p.x() << " " << p.y() << std::endl;
}

void PrinterGCL::visitLine(const Line& l) {
  ostr_ << "line " << l.id() << " " << l.point1() << " " << l.point2() << std::endl;
}

void PrinterGCL::visitDrawPoint(const DrawPoint& e) {
  ostr_ << "cmark " << e.point() << std::endl;
}

void PrinterGCL::visitLabelPoint(const LabelPoint& e) {
  ostr_ << "mark_lt " << e.point() << std::endl;
}

void PrinterGCL::visitDrawSegment(const DrawSegment& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "drawsegment " << e.point1() << " " << e.point2() << std::endl;
    break;
  case DASHED:
    ostr_ << "drawdashsegment " << e.point1() << " " << e.point2() << std::endl;
    break;
  }
}

void PrinterGCL::visitDrawLine(const DrawLine& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "drawline " << e.line() << std::endl;
    break;
  case DASHED:
    ostr_ << "drawdashline " << e.line() << std::endl;
    break;
  }
}

void PrinterGCL::visitDrawLine_P(const DrawLine_P& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "drawline " << e.point1() << " " << e.point2() << std::endl;
    break;
  case DASHED:
    ostr_ << "drawdashline " << e.point1() << " " << e.point2() << std::endl;
    break;
  }
}


void PrinterGCL::visitFunMidpoint(const FunMidpoint& e) {
  ostr_ << "midpoint " << e.newPoint() << " " << e.point1() << " " << e.point2() << std::endl;
}

void PrinterGCL::visitFunSegmentBisector(const FunSegmentBisector& e) {
  ostr_ << "med " << e.newLine() << " " << e.point1() << " " << e.point2() << std::endl;
}

void PrinterGCL::visitFunParallel(const FunParallel& e) {
  ostr_ << "parallel " << e.newLine() << " " << e.point() << " " << e.line() << std::endl;  
}

void PrinterGCL::visitFunPerpendicular(const FunPerpendicular& e) {
  ostr_ << "perp " << e.newLine() << " " << e.point() << " " << e.line() << std::endl;  
}

void PrinterGCL::visitFunIntersectLL(const FunIntersectLL& e) {
  ostr_ << "intersec " << e.newPoint() << " " << e.line1() << " " << e.line2() << std::endl;
}

void PrinterGCL::visitFunIntersectLL_P(const FunIntersectLL_P& e) {
  ostr_ << "intersec " << e.newPoint() << " " << e.A1() << " " << e.B1() << " " << e.A2() << " " << e.B2() << std::endl;
}

void PrinterGCL::visitOnLine(const OnLine& e) {
  ostr_ << "online " << e.X() << " " << e.A() << " " << e.B() << std::endl;
}

void PrinterGCL::visitOnParallel(const OnParallel& e) {
  ostr_ << "translate " << e.X() << " " << e.A() << " " << e.B() << " " << e.P() << std::endl;
}

void PrinterGCL::visitOnPerpendicular(const OnPerpendicular& e) {
  ostr_ << "%";
  e.print(ostr_);
  ostr_ << std::endl;
  std::string l = AuxiliaryLines::get();
  ostr_ << "line " << l << " " << e.A() << " " << e.B() << std::endl;
  std::string p = AuxiliaryLines::get();
  ostr_ << "perp " << p << " " << e.P() << " " << l << std::endl;
  std::string N = AuxiliaryPoints::get();
  ostr_ << "intersec " << N << " " << l << " " << p << std::endl;
  ostr_ << "translate " << e.X() << " " << N << " " << e.P() << " " << e.P() << std::endl;
}


void PrinterGCL::visitMidpoint(const Midpoint&) {
  throw std::string("Predicates in hypotheses are not supported");
}

void PrinterGCL::visitParallel_P(const Parallel_P& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    ostr_ << "prove { " << "parallel " << e.A1() << " " << e.B1() << " " << e.A2() << " " << e.B2() << " } ";
}

void PrinterGCL::visitPerpendicular_P(const Perpendicular_P& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    ostr_ << "prove { " << "perpendicular " << e.A1() << " " << e.B1() << " " << e.A2() << " " << e.B2() << " } ";
}

void PrinterGCL::visitCongruent(const Congruent& e) {
  if (!printingConjectures_)
    throw std::string("Predicates hypotheses are not supported");
  else
    ostr_ << "prove { " << "samelength " << e.A1() << " " << e.B1() << " " << e.A2() << " " << e.B2() << " } ";
}
  
void PrinterGCL::visitCollinear(const Collinear& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    ostr_ << "prove { " << "collinear " << e.A() << " " << e.B() << " " << e.C() << " } ";
}
