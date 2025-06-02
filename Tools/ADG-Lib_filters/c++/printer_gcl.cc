#include "printer_gcl.hh"


void PrinterGCL::visitConstant(const Constant&) {
}

void PrinterGCL::visitVariable(const Variable& v) {
  ostr_ << v.name();
}

void PrinterGCL::visitNaryExpression(const NaryExpression& e) {
  ostr_ << e.op() << " ";
  for (ExprPtr operand : e.operands()) {
    operand->acceptVisitor(*this);
    ostr_ << " ";
  }
  ostr_ << std::endl;
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

void PrinterGCL::visitDrawSegment(const DrawSegment& e) {
  ostr_ << "drawsegment " << e.point1() << " " << e.point2() << std::endl;
}


void PrinterGCL::visitFunMidpoint(const FunMidpoint& e) {
  ostr_ << "midpoint " << e.newPoint() << " " << e.point1() << " " << e.point2() << std::endl;
  
}

void PrinterGCL::visitFunParallel(const FunParallel& e) {
  ostr_ << "parallel " << e.newLine() << " " << e.point() << " " << e.line() << std::endl;
  
}

void PrinterGCL::visitFunIntersectLL(const FunIntersectLL& e) {
  ostr_ << "intersec " << e.newPoint() << " " << e.line1() << " " << e.line2() << std::endl;
}

void PrinterGCL::visitFunIntersectLL_P(const FunIntersectLL_P& e) {
  ostr_ << "intersec " << e.newPoint() << " " << e.A1() << " " << e.B1() << " " << e.A2() << " " << e.B2() << std::endl;
}

void PrinterGCL::visitOnParallel(const OnParallel& e) {
  ostr_ << "translate " << e.B1() << " " << e.A() << " " << e.B() << " " << e.A1() << std::endl;
}
