#include "printer_geocoq.hh"

/*
Lemma foo : forall A B C B_1 A_1,
  Midpoint B_1 B C -> Midpoint A_1 A C -> A_1 <> B_1 -> A <> B ->
  Par A_1 B_1 A B.
*/

template<typename... Args>
std::string printPredicateCoq(const std::string& name, const Args&... args) {
  std::ostringstream oss;
  oss << name << " ";
  std::string separator = "";
  ((oss << separator << args, separator = " "), ...);
  return oss.str();
}


void PrinterGeoCoq::visitConstant(const Constant& c){
  current_ << c.value();
}

void PrinterGeoCoq::visitVariable(const Variable& v){
  current_ << v.name();
}

void PrinterGeoCoq::visitNaryExpression(const NaryExpression& e){
  auto ops = e.operands();
  std::string op = e.op();

  if (e.op() == "&") {
    ops[0]->acceptVisitor(*this); 
    for (int i = 1; i < ops.size(); i++) {
      ops[i]->acceptVisitor(*this);
    }
  } else if (e.op() == "!=") {
    ops[0]->acceptVisitor(*this);
    current_ << " <> ";
    ops[1]->acceptVisitor(*this);
    conjuncts_.push_back(current_.str());
    current_.str("");
    current_.clear();
  } else {
    throw std::string("Not supported");
  }
}

void PrinterGeoCoq::visitFreePoint(const FreePoint&){
}
void PrinterGeoCoq::visitLine(const Line&){
}
void PrinterGeoCoq::visitCircle(const Circle&){
}
  
void PrinterGeoCoq::visitDrawPoint(const DrawPoint&){
}
void PrinterGeoCoq::visitDrawSegment(const DrawSegment&){
}
void PrinterGeoCoq::visitDrawLine(const DrawLine&){
}
void PrinterGeoCoq::visitDrawLine_P(const DrawLine_P&){
}
void PrinterGeoCoq::visitDrawCircle(const DrawCircle&){
}
void PrinterGeoCoq::visitDrawCircle_P(const DrawCircle_P&){
}
void PrinterGeoCoq::visitLabelPoint(const LabelPoint&){
}

void PrinterGeoCoq::visitFunTowards(const FunTowards&){
}
void PrinterGeoCoq::visitFunFoot(const FunFoot&){
}
void PrinterGeoCoq::visitFunMidpoint(const FunMidpoint&){
}
void PrinterGeoCoq::visitFunSegmentBisector(const FunSegmentBisector&){
}
void PrinterGeoCoq::visitFunParallel(const FunParallel&){
}
void PrinterGeoCoq::visitFunPerpendicular(const FunPerpendicular&){
}
void PrinterGeoCoq::visitFunPerpendicular_P(const FunPerpendicular_P&){
}
void PrinterGeoCoq::visitFunTranslate(const FunTranslate& e) {
}
void PrinterGeoCoq::visitFunIntersectLL(const FunIntersectLL&){
}
void PrinterGeoCoq::visitFunIntersectLL_P(const FunIntersectLL_P&){
}

void PrinterGeoCoq::visitTowards(const Towards& e){
  conjuncts_.push_back(printPredicateCoq("Towards", e.X(), e.A(), e.B(), e.R()));
}
void PrinterGeoCoq::visitFoot(const Foot& e){
  conjuncts_.push_back(printPredicateCoq("Foot", e.X(), e.P(), e.p()));
}
void PrinterGeoCoq::visitMidpoint(const Midpoint& e){
  conjuncts_.push_back(printPredicateCoq("Midpoint", e.X(), e.A(), e.B()));
}
void PrinterGeoCoq::visitParallel_P(const Parallel_P& e){
  conjuncts_.push_back(printPredicateCoq("Par", e.A1(), e.B1(), e.A2(), e.B2()));
}
void PrinterGeoCoq::visitParallelDG_P(const ParallelDG_P& e){
  throw std::string("Not supported");
}
void PrinterGeoCoq::visitPerpendicular_P(const Perpendicular_P& e){
  conjuncts_.push_back(printPredicateCoq("Perp", e.A1(), e.B1(), e.A2(), e.B2()));
}
void PrinterGeoCoq::visitPerpendicularDG_P(const PerpendicularDG_P& e){
  throw std::string("Not supported");
}
void PrinterGeoCoq::visitFoot_P(const Foot_P& e){
  // CHECK IF THIS EXISTS IN GEOCOQ
  conjuncts_.push_back(printPredicateCoq("Foot", e.X(), e.P(), e.A(), e.B()));
}
void PrinterGeoCoq::visitCongruent(const Congruent& e){
  conjuncts_.push_back(printPredicateCoq("Cong", e.A1(), e.B1(), e.A2(), e.B2()));
}
void PrinterGeoCoq::visitCollinear(const Collinear& e){
  conjuncts_.push_back(printPredicateCoq("Col", e.A(), e.B(), e.C()));
}

void PrinterGeoCoq::visitEqual(const Equal& e){
  e.operands()[0]->acceptVisitor(*this);
  current_ << " = ";
  e.operands()[1]->acceptVisitor(*this);
  conjuncts_.push_back(current_.str());
  current_.str("");
  current_.clear();
}

void PrinterGeoCoq::visitAlgSum3(const AlgSum3& e) {
  e.operands()[0]->acceptVisitor(*this);
  current_ << " + ";
  e.operands()[1]->acceptVisitor(*this);
  current_ << " + ";
  e.operands()[2]->acceptVisitor(*this);
  current_ << " = 0";
  conjuncts_.push_back(current_.str());
  current_.str("");
  current_.clear();
}

void PrinterGeoCoq::visitIdentical(const Identical& e) {
  conjuncts_.push_back(e.A().name() + " = " + e.B().name());
}
void PrinterGeoCoq::visitHarmonic(const Harmonic& e){
  throw std::string("Not supported");
}
  
void PrinterGeoCoq::visitOnLine_P(const OnLine_P&){
 // todo
}  
void PrinterGeoCoq::visitOnCircle_P(const OnCircle_P&){
 // todo
}  
void PrinterGeoCoq::visitOnParallel_P(const OnParallel_P&){
 // todo
}  
void PrinterGeoCoq::visitOnPerpendicular_P(const OnPerpendicular_P&){
 // todo
}  

void PrinterGeoCoq::printConjuncts(const std::string& separator) const {
  ostr_ << conjuncts_[0];
  for (int i = 1; i < conjuncts_.size(); i++)
    ostr_ << " " << separator << std::endl << conjuncts_[i];
}
