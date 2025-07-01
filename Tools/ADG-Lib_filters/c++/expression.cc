#include "expression.hh"

// Constant implementation
Constant::Constant(double value) : value_(value) {}

void Constant::print(std::ostream& os) const {
    os << value_;
}

double Constant::value() const {
    return value_;
}

void Constant::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitConstant(*this);
}

ExprPtr Constant::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformConstant(*this);
}

// Variable implementation
Variable::Variable(std::string name) : name_(std::move(name)) {}

void Variable::print(std::ostream& os) const {
    os << name_;
}

const std::string& Variable::name() const {
    return name_;
}

void Variable::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitVariable(*this);
}

ExprPtr Variable::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformVariable(*this);
}


// NaryExpression implementation
void NaryExpression::setInfix(Operator op) {
  infix_ = op_ == "&" || op_ == "|" || op == "=" || op == "*" || op == "+";
}

NaryExpression::NaryExpression(Operator op, std::vector<ExprPtr> operands)
    : op_(op), operands_(std::move(operands)) {
  setInfix(op);
}

NaryExpression::NaryExpression(Operator op, ExprPtr op1, ExprPtr op2)
    : op_(op) {
  operands_.push_back(op1);
  operands_.push_back(op2);
  setInfix(op);
}

void NaryExpression::print(std::ostream& os) const {
  if (infix_) {
    operands_[0]->print(os);
    for (int i = 1; i < operands_.size(); ++i) {
      os << op_;
      operands_[i]->print(os);
    }
  } else {
    os << op_ << "(";
    for (size_t i = 0; i < operands_.size(); ++i) {
      operands_[i]->print(os);
      if (i + 1 < operands_.size()) 
        os << ",";
    }
    os << ")";
  }
}

const std::vector<ExprPtr>& NaryExpression::operands() const {
    return operands_;
}

Operator NaryExpression::op() const {
    return op_;
}

void NaryExpression::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitNaryExpression(*this);
}

ExprPtr NaryExpression::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformNaryExpression(*this);
}

// FreePoint implementation

void FreePoint::print(std::ostream& ostr) const  {
  ostr << "(free_point " << id() << ")" << std::endl;
}

void FreePoint::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFreePoint(*this);
}

ExprPtr FreePoint::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFreePoint(*this);
}

// Line implementation

void Line::print(std::ostream& ostr) const  {
  ostr << "(line " << id_ << ")" << std::endl;
}

void Line::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitLine(*this);
}

ExprPtr Line::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformLine(*this);
}


// DrawPoint implementation
void DrawPoint::print(std::ostream& ostr) const  {
  ostr << "(draw_point " << A_ << ")" << std::endl;
}

void DrawPoint::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitDrawPoint(*this);
}

ExprPtr DrawPoint::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformDrawPoint(*this);
}

// LabelPoint implementation
void LabelPoint::print(std::ostream& ostr) const  {
  ostr << "(label_point " << A_ << ")" << std::endl;
}

void LabelPoint::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitLabelPoint(*this);
}

ExprPtr LabelPoint::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformLabelPoint(*this);
}


// DrawSegment implementation
void DrawSegment::print(std::ostream& ostr) const  {
  ostr << "(draw_segment " << A_ << "," << B_ << ")" << std::endl;
}

void DrawSegment::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitDrawSegment(*this);
}

ExprPtr DrawSegment::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformDrawSegment(*this);
}

// DrawLine implementation
void DrawLine::print(std::ostream& ostr) const  {
  ostr << "(draw_line " << l_ << ")" << std::endl;
}

void DrawLine::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitDrawLine(*this);
}

ExprPtr DrawLine::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformDrawLine(*this);
}

// DrawLine_P implementation
void DrawLine_P::print(std::ostream& ostr) const  {
  ostr << "(draw_line " << A_ << "," << B_ << ")" << std::endl;
}

void DrawLine_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitDrawLine_P(*this);
}

ExprPtr DrawLine_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformDrawLine_P(*this);
}

// FunMidpoint implementation

void FunMidpoint::print(std::ostream& ostr) const {
  ostr << "(fun_midpoint " << X_ << "," << A_ << "," << B_ << ")";
}

void FunMidpoint::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunMidpoint(*this);
}

ExprPtr FunMidpoint::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunMidpoint(*this);
}

// Midpoint implementation

void Midpoint::print(std::ostream& ostr) const {
  ostr << "(midpoint " << X_ << "," << A_ << "," << B_ << ")";
}

void Midpoint::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitMidpoint(*this);
}

ExprPtr Midpoint::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformMidpoint(*this);
}

// Parallel_P implementation

void Parallel_P::print(std::ostream& ostr) const {
  ostr << "(parallel_p " << A1_ << "," << B1_ << "," << A2_ << "," << B2_ << ")";
}

void Parallel_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitParallel_P(*this);
}

ExprPtr Parallel_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformParallel_P(*this);
}

// ParallelDG_P implementation

void ParallelDG_P::print(std::ostream& ostr) const {
  ostr << "(paralleldg_p " << A1_ << "," << B1_ << "," << A2_ << "," << B2_ << ")";
}

void ParallelDG_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitParallelDG_P(*this);
}

ExprPtr ParallelDG_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformParallelDG_P(*this);
}


// Perpendicular_P implementation

void Perpendicular_P::print(std::ostream& ostr) const {
  ostr << "(perpendicular_p " << A1_ << "," << B1_ << "," << A2_ << "," << B2_ << ")";
}

void Perpendicular_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitPerpendicular_P(*this);
}

ExprPtr Perpendicular_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformPerpendicular_P(*this);
}

// Foot_P implementation

void Foot_P::print(std::ostream& ostr) const {
  ostr << "(foot_p " << X_ << "," << P_ << "," << A_ << "," << B_ << ")";
}

void Foot_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFoot_P(*this);
}

ExprPtr Foot_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFoot_P(*this);
}


// PerpendicularDG_P implementation

void PerpendicularDG_P::print(std::ostream& ostr) const {
  ostr << "(perpendiculardg_p " << A1_ << "," << B1_ << "," << A2_ << "," << B2_ << ")";
}

void PerpendicularDG_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitPerpendicularDG_P(*this);
}

ExprPtr PerpendicularDG_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformPerpendicularDG_P(*this);
}

// Congruent implementation

void Congruent::print(std::ostream& ostr) const {
  ostr << "(congruent " << A1_ << "," << B1_ << "," << A2_ << ", " << B2_ << ")";
}

void Congruent::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitCongruent(*this);
}

ExprPtr Congruent::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformCongruent(*this);
}

// Harmonic implementation

void Harmonic::print(std::ostream& ostr) const {
  ostr << "(harmonic " << A_ << "," << B_ << "," << C_ << ", " << D_ << ")";
}

void Harmonic::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitHarmonic(*this);
}

ExprPtr Harmonic::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformHarmonic(*this);
}

// Collinear implementation

void Collinear::print(std::ostream& ostr) const {
  ostr << "(collinear " << A_ << "," << B_ << "," << C_ << ")";
}

void Collinear::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitCollinear(*this);
}

ExprPtr Collinear::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformCollinear(*this);
}

// Equal implementation

void Equal::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitEqual(*this);
}

ExprPtr Equal::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformEqual(*this);
}

// Identical implementation

void Identical::print(std::ostream& ostr) const {
  ostr << "(identical " << A_ << "," << B_ << ")";
}

void Identical::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitIdentical(*this);
}

ExprPtr Identical::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformIdentical(*this);
}

// FunSegmentBisector implementation

void FunSegmentBisector::print(std::ostream& ostr) const {
  ostr << "(fun_segment_bisector " << x_ << "," << A_ << "," << B_ << ")";
}

void FunSegmentBisector::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunSegmentBisector(*this);
}

ExprPtr FunSegmentBisector::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunSegmentBisector(*this);
}


// FunParallel implementation

void FunParallel::print(std::ostream& ostr) const {
  ostr << "(fun_paralel " << x_ << "," << A_ << "," << l_ << ")";
}

void FunParallel::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunParallel(*this);
}

ExprPtr FunParallel::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunParallel(*this);
}

// FunPerpendicular implementation

void FunPerpendicular::print(std::ostream& ostr) const {
  ostr << "(fun_peprpendicular " << x_ << "," << A_ << "," << l_ << ")";
}

void FunPerpendicular::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunPerpendicular(*this);
}

ExprPtr FunPerpendicular::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunPerpendicular(*this);
}

// FunPerpendicular_P implementation
void FunPerpendicular_P::print(std::ostream& ostr) const {
  ostr << "(fun_peprpendicular_p " << x_ << "," << A_ << "," << B_ << "," << P_ << ")";
}

void FunPerpendicular_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunPerpendicular_P(*this);
}

ExprPtr FunPerpendicular_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunPerpendicular_P(*this);
}

// FunIntersectLL implementation

void FunIntersectLL::print(std::ostream& ostr) const {
  ostr << "(fun_intersect_ll " << X_ << "," << l1_ << "," << l2_ << ")";
}

void FunIntersectLL::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunIntersectLL(*this);
}

ExprPtr FunIntersectLL::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunIntersectLL(*this);
}

// FunIntersectLL_P implementation

void FunIntersectLL_P::print(std::ostream& ostr) const {
  ostr << "(fun_intersect_ll_p " << X_ << "," << A1_ << "," << B1_ << "," << A2_ << "," << B2_ << ")";
}

void FunIntersectLL_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunIntersectLL_P(*this);
}

ExprPtr FunIntersectLL_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunIntersectLL_P(*this);
}

// OnLine_P implementation

void OnLine_P::print(std::ostream& ostr) const {
  ostr << "(on_line_p " << X_ << "," << A_ << "," << B_ << ")";
}

void OnLine_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitOnLine_P(*this);
}

ExprPtr OnLine_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformOnLine_P(*this);
}


// OnParallel_P implementation

void OnParallel_P::print(std::ostream& ostr) const {
  ostr << "(on_parallel_p " << X_ << "," << A_ << "," << B_ << "," << P_ << ")";
}

void OnParallel_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitOnParallel_P(*this);
}

ExprPtr OnParallel_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformOnParallel_P(*this);
}

// OnPerpendicular implementation

void OnPerpendicular_P::print(std::ostream& ostr) const {
  ostr << "(on_perpendicular_p " << X_ << "," << A_ << "," << B_ << "," << P_ << ")";
}

void OnPerpendicular_P::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitOnPerpendicular_P(*this);
}

ExprPtr OnPerpendicular_P::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformOnPerpendicular_P(*this);
}

// Operator overload
std::ostream& operator<<(std::ostream& os, const Expression& expr) {
    expr.print(os);
    return os;
}

