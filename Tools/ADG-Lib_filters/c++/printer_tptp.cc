#include "printer_tptp.hh"

std::string to_uppercase(const std::string& input) {
    std::string result(input);
    std::transform(result.begin(), result.end(), result.begin(),
        [](unsigned char c) {
            return std::toupper(c);
        });
    return result;
}

template<typename... Args>
void printPredicate(std::ostream& ostr, const std::string& name, const Args&... args) {
  ostr << name << "(";
  // Helper lambda to print arguments with the correct formatting
  std::string separator = "";
  ((ostr << separator << args, separator = ", "), ...);
  ostr << ")";
}

void PrinterTPTP::visitConstant(const Constant&) {
}

void PrinterTPTP::visitVariable(const Variable& v) {
}

void PrinterTPTP::visitNaryExpression(const NaryExpression& e) {
  if (e.op() == "&") {
    auto ops = e.operands();
    ops[0]->acceptVisitor(*this);
    for (int i = 1; i < ops.size(); i++) {
      ostr_ << " & ";
      ops[i]->acceptVisitor(*this);
    }
  }
}

void PrinterTPTP::visitFreePoint(const FreePoint& p) {
}

void PrinterTPTP::visitLine(const Line& l) {
}

void PrinterTPTP::visitDrawPoint(const DrawPoint& e) {
}

void PrinterTPTP::visitDrawSegment(const DrawSegment& e) {
}

void PrinterTPTP::visitDrawLine(const DrawLine& e) {
}

void PrinterTPTP::visitDrawLine_P(const DrawLine_P& e) {
}

void PrinterTPTP::visitLabelPoint(const LabelPoint& e) {
}


void PrinterTPTP::visitFunMidpoint(const FunMidpoint& e) {
}

void PrinterTPTP::visitFunSegmentBisector(const FunSegmentBisector& e) {
}

void PrinterTPTP::visitFunParallel(const FunParallel& e) {
}

void PrinterTPTP::visitFunPerpendicular(const FunPerpendicular& e) {
}

void PrinterTPTP::visitFunIntersectLL(const FunIntersectLL& e) {
}

void PrinterTPTP::visitFunIntersectLL_P(const FunIntersectLL_P& e) {
}

void PrinterTPTP::visitMidpoint(const Midpoint& e) {
  printPredicate(ostr_, "midp", e.midpoint(), e.point1(), e.point2());
}

void PrinterTPTP::visitParallel_P(const Parallel_P& e) {
  printPredicate(ostr_, "para", e.A1(), e.B1(), e.A2(), e.B2());
}

void PrinterTPTP::visitPerpendicular_P(const Perpendicular_P& e) {
  printPredicate(ostr_, "perp", e.A1(), e.B1(), e.A2(), e.B2());
}

void PrinterTPTP::visitCollinear(const Collinear& e) {
  printPredicate(ostr_, "coll", e.A(), e.B(), e.C());
}

void PrinterTPTP::visitCongruent(const Congruent& e) {
  printPredicate(ostr_, "cong", e.A1(), e.B1(), e.A2(), e.B2());
}


void PrinterTPTP::visitOnLine(const OnLine& e) {
}

void PrinterTPTP::visitOnParallel(const OnParallel& e) {
}

void PrinterTPTP::visitOnPerpendicular(const OnPerpendicular& e) {
}

