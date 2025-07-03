#include "printer_tptp.hh"
#include <map>
#include <sstream>

std::string to_uppercase(const std::string& input) {
    std::string result(input);
    std::transform(result.begin(), result.end(), result.begin(),
        [](unsigned char c) {
            return std::toupper(c);
        });
    return result;
}

template<typename... Args>
std::string printPredicate(const std::string& name, const Args&... args) {
  std::ostringstream oss;
  oss << name << "(";
  std::string separator = "";
  ((oss << separator << args, separator = ", "), ...);
  oss << ")";
  return oss.str();
}

void PrinterTPTP::visitConstant(const Constant& c) {
  current_ << c.value();
}

void PrinterTPTP::visitVariable(const Variable& v) {
  current_ << v.name();
}

void PrinterTPTP::visitNaryExpression(const NaryExpression& e) {
  auto ops = e.operands();
  std::string op = e.op();
  std::map<std::string, std::string> longNames {{"*", "mult"}, {"+", "add"}};
  if (longNames.count(op))
    op = longNames[op];

  if (e.op() == "&") {
    ops[0]->acceptVisitor(*this); 
    for (int i = 1; i < ops.size(); i++) {
      ops[i]->acceptVisitor(*this);
    }
  } else if (e.op() == "!=") {
    ops[0]->acceptVisitor(*this);
    current_ << " != ";
    ops[1]->acceptVisitor(*this);
    conjuncts_.push_back(current_.str());
    current_.str("");
    current_.clear();
  } else {
    current_ << op << "(";
    ops[0]->acceptVisitor(*this);
    for (int i = 1; i < ops.size(); i++) {
      current_ << ", ";
      ops[i]->acceptVisitor(*this);
    }
    current_ << ")";
  }
}

void PrinterTPTP::visitFreePoint(const FreePoint& p) {
}

void PrinterTPTP::visitLine(const Line& l) {
}

void PrinterTPTP::visitCircle(const Circle& c) {
}

void PrinterTPTP::visitDrawPoint(const DrawPoint& e) {
}

void PrinterTPTP::visitDrawSegment(const DrawSegment& e) {
}

void PrinterTPTP::visitDrawLine(const DrawLine& e) {
}

void PrinterTPTP::visitDrawLine_P(const DrawLine_P& e) {
}

void PrinterTPTP::visitDrawCircle(const DrawCircle& e) {
}

void PrinterTPTP::visitDrawCircle_P(const DrawCircle_P& e) {
}

void PrinterTPTP::visitLabelPoint(const LabelPoint& e) {
}

void PrinterTPTP::visitFunTowards(const FunTowards& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitFunFoot(const FunFoot& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitFunMidpoint(const FunMidpoint& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitFunSegmentBisector(const FunSegmentBisector& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitFunParallel(const FunParallel& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitFunPerpendicular(const FunPerpendicular& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitFunPerpendicular_P(const FunPerpendicular_P& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitFunTranslate(const FunTranslate& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitFunIntersectLL(const FunIntersectLL& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitFunIntersectLL_P(const FunIntersectLL_P& e) {
  throw std::string("Functions should have been eliminated");
}

void PrinterTPTP::visitTowards(const Towards& e) {
  conjuncts_.push_back(printPredicate("towards", e.X(), e.A(), e.B(), e.R	()));
}

void PrinterTPTP::visitFoot(const Foot& e) {
  conjuncts_.push_back(printPredicate("foot", e.X(), e.P(), e.p()));
}

void PrinterTPTP::visitMidpoint(const Midpoint& e) {
  conjuncts_.push_back(printPredicate("midpoint", e.X(), e.A(), e.B()));
}

void PrinterTPTP::visitParallel_P(const Parallel_P& e) {
  conjuncts_.push_back(printPredicate("parallel", e.A1(), e.B1(), e.A2(), e.B2()));
}

void PrinterTPTP::visitParallelDG_P(const ParallelDG_P& e) {
  conjuncts_.push_back(printPredicate("parallelDG", e.A1(), e.B1(), e.A2(), e.B2()));
}

void PrinterTPTP::visitPerpendicular_P(const Perpendicular_P& e) {
  conjuncts_.push_back(printPredicate("perpendicular", e.A1(), e.B1(), e.A2(), e.B2()));
}

void PrinterTPTP::visitPerpendicularDG_P(const PerpendicularDG_P& e) {
  conjuncts_.push_back(printPredicate("perpendicularDG", e.A1(), e.B1(), e.A2(), e.B2()));
}

void PrinterTPTP::visitFoot_P(const Foot_P& e) {
  conjuncts_.push_back(printPredicate("foot", e.X(), e.P(), e.A(), e.B()));
}

void PrinterTPTP::visitCollinear(const Collinear& e) {
  conjuncts_.push_back(printPredicate("collinear", e.A(), e.B(), e.C()));
}

void PrinterTPTP::visitEqual(const Equal& e) {
  current_ << "(";
  e.operands()[0]->acceptVisitor(*this);
  current_ << ")";
  current_ << " = ";
  current_ << "(";
  e.operands()[1]->acceptVisitor(*this);
  current_ << ")";
  conjuncts_.push_back(current_.str());
  current_.str("");
  current_.clear();
}

void PrinterTPTP::visitCongruent(const Congruent& e) {
  conjuncts_.push_back(printPredicate("cong", e.A1(), e.B1(), e.A2(), e.B2()));
}

void PrinterTPTP::visitIdentical(const Identical& e) {
  conjuncts_.push_back(e.A().name() + " = " + e.B().name());
}

void PrinterTPTP::visitAlgSum3(const AlgSum3& e) {
  current_ << "(";
  e.operands()[0]->acceptVisitor(*this);
  current_ << ") + ";
  current_ << "(";
  e.operands()[1]->acceptVisitor(*this);
  current_ << ") + ";
  current_ << "(";
  e.operands()[2]->acceptVisitor(*this);
  current_ << ") = ";
  current_ << "( 0 )";
  conjuncts_.push_back(current_.str());
  current_.str("");
  current_.clear();

}

void PrinterTPTP::visitHarmonic(const Harmonic& e) {
  conjuncts_.push_back(printPredicate("harmonic", e.A(), e.B(), e.C(), e.D()));
}

void PrinterTPTP::visitOnLine_P(const OnLine_P& e) {
  throw std::string("Non-deterministic functions should have been eliminated");
}
void PrinterTPTP::visitOnCircle_P(const OnCircle_P& e) {
  throw std::string("Non-deterministic functions should have been eliminated");
}
void PrinterTPTP::visitOnParallel_P(const OnParallel_P& e) {
  throw std::string("Non-deterministic functions should have been eliminated");
}

void PrinterTPTP::visitOnPerpendicular_P(const OnPerpendicular_P& e) {
  throw std::string("Non-deterministic functions should have been eliminated");
}

void PrinterTPTP::visitTriangle(const Triangle& e) {
  visitFreePoint(e.A());
  visitFreePoint(e.B());
  visitFreePoint(e.C());
}
