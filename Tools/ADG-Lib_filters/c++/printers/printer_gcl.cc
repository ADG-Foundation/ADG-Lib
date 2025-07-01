#include "printer_gcl.hh"
#include <map>

void PrinterGCL::visitConstant(const Constant& c) {
  ostr_ << c.value();
}

void PrinterGCL::visitVariable(const Variable& v) {
  ostr_ << v.name();
}

void PrinterGCL::visitNaryExpression(const NaryExpression& e) {
  if (e.op() == "&") {
    for (ExprPtr operand : e.operands())
      operand->acceptVisitor(*this);
  } else {
    std::string op = e.op();
    std::map<std::string, std::string> longNames {{"*", "mult"}, {"+", "add"}};
    if (longNames.count(op))
      op = longNames[op];
    
    ostr_ << "{ " << op << " ";
    for (ExprPtr operand : e.operands()) {
      operand->acceptVisitor(*this);
      ostr_ << " ";
    }
    ostr_ << " }";
  }
}

void PrinterGCL::visitFreePoint(const FreePoint& p) {
  ostr_ << "point " << p.id() << " " << p.x() << " " << p.y() << std::endl;
}

void PrinterGCL::visitLine(const Line& l) {
  ostr_ << "line " << l.id() << " " << l.point1() << " " << l.point2() << std::endl;
}

void PrinterGCL::visitDrawPoint(const DrawPoint& e) {
  ostr_ << "cmark " << e.A() << std::endl;
}

void PrinterGCL::visitLabelPoint(const LabelPoint& e) {
  ostr_ << "mark_lt " << e.A() << std::endl;
}

void PrinterGCL::visitDrawSegment(const DrawSegment& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "drawsegment " << e.A() << " " << e.B() << std::endl;
    break;
  case DASHED:
    ostr_ << "drawdashsegment " << e.A() << " " << e.B() << std::endl;
    break;
  }
}

void PrinterGCL::visitDrawLine(const DrawLine& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "drawline " << e.l() << std::endl;
    break;
  case DASHED:
    ostr_ << "drawdashline " << e.l() << std::endl;
    break;
  }
}

void PrinterGCL::visitDrawLine_P(const DrawLine_P& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "drawline " << e.A() << " " << e.B() << std::endl;
    break;
  case DASHED:
    ostr_ << "drawdashline " << e.A() << " " << e.B() << std::endl;
    break;
  }
}


void PrinterGCL::visitFunMidpoint(const FunMidpoint& e) {
  ostr_ << "midpoint " << e.X() << " " << e.A() << " " << e.B() << std::endl;
}

void PrinterGCL::visitFunSegmentBisector(const FunSegmentBisector& e) {
  ostr_ << "med " << e.x() << " " << e.A() << " " << e.B() << std::endl;
}

void PrinterGCL::visitFunParallel(const FunParallel& e) {
  ostr_ << "parallel " << e.x() << " " << e.A() << " " << e.l() << std::endl;  
}

void PrinterGCL::visitFunPerpendicular(const FunPerpendicular& e) {
  ostr_ << "perp " << e.x() << " " << e.A() << " " << e.l() << std::endl;  
}

void PrinterGCL::visitFunPerpendicular_P(const FunPerpendicular_P& e) {
  std::string l = AuxiliaryLines::get();
  ostr_ << "line " << l << " " << e.A() << " " << e.B() << std::endl;
  ostr_ << "perp " << e.x() << " " << e.P() << " " << l << std::endl;  
}

void PrinterGCL::visitFunIntersectLL(const FunIntersectLL& e) {
  ostr_ << "intersec " << e.X() << " " << e.l1() << " " << e.l2() << std::endl;
}

void PrinterGCL::visitFunIntersectLL_P(const FunIntersectLL_P& e) {
  ostr_ << "intersec " << e.X() << " " << e.A1() << " " << e.B1() << " " << e.A2() << " " << e.B2() << std::endl;
}

void PrinterGCL::visitOnLine_P(const OnLine_P& e) {
  ostr_ << "online " << e.X() << " " << e.A() << " " << e.B() << std::endl;
}

void PrinterGCL::visitOnParallel_P(const OnParallel_P& e) {
  ostr_ << "translate " << e.X() << " " << e.A() << " " << e.B() << " " << e.P() << std::endl;
}

void PrinterGCL::visitOnPerpendicular_P(const OnPerpendicular_P& e) {
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
    throw std::string("Non-degenerate parallel is not supported by GCL");
}

void PrinterGCL::visitParallelDG_P(const ParallelDG_P& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    ostr_ << "prove { " << "parallel " << e.A1() << " " << e.B1() << " " << e.A2() << " " << e.B2() << " } ";
}

void PrinterGCL::visitPerpendicular_P(const Perpendicular_P& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    throw std::string("Non-degenerate perpendicular is not supported by GCL");
}

void PrinterGCL::visitFoot_P(const Foot_P& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    throw std::string("Proving foot is not supported by GCL");
}


void PrinterGCL::visitPerpendicularDG_P(const PerpendicularDG_P& e) {
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

void PrinterGCL::visitEqual(const Equal& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else {
    ostr_ << "prove { " << "equal ";
    e.operands()[0]->acceptVisitor(*this);
    ostr_ << " ";
    e.operands()[1]->acceptVisitor(*this);
    ostr_ << " } ";
  }
}

void PrinterGCL::visitIdentical(const Identical& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else {
    ostr_ << "prove { " << "identical ";
    e.A().acceptVisitor(*this);
    ostr_ << " ";
    e.B().acceptVisitor(*this);
    ostr_ << " } ";
  }
}

void PrinterGCL::visitHarmonic(const Harmonic& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else {
    ostr_ << "prove { " << "harmonic ";
    e.A().acceptVisitor(*this);
    ostr_ << " ";
    e.B().acceptVisitor(*this);
    ostr_ << " ";
    e.C().acceptVisitor(*this);
    ostr_ << " ";
    e.D().acceptVisitor(*this);
    ostr_ << " } ";
  }
}
