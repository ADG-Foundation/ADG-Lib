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
NaryExpression::NaryExpression(Operator op, std::vector<ExprPtr> operands)
    : op_(op), operands_(std::move(operands)) {
  infix_ = op_ == "&" || op_ == "|";
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

// DrawPoint implementation
void DrawPoint::print(std::ostream& ostr) const  {
  ostr << "(draw_point " << point_ << ")" << std::endl;
}

void DrawPoint::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitDrawPoint(*this);
}

ExprPtr DrawPoint::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformDrawPoint(*this);
}

// DrawSegment implementation
void DrawSegment::print(std::ostream& ostr) const  {
  ostr << "(draw_segment " << point1_ << "," << point2_ << ")" << std::endl;
}

void DrawSegment::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitDrawSegment(*this);
}

ExprPtr DrawSegment::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformDrawSegment(*this);
}


// FunMidpoint implementation

void FunMidpoint::print(std::ostream& ostr) const {
  ostr << "(midpoint " << new_point_ << "," << point1_ << "," << point2_ << ")";
}

void FunMidpoint::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunMidpoint(*this);
}

ExprPtr FunMidpoint::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunMidpoint(*this);
}

// FunParallel implementation

void FunParallel::print(std::ostream& ostr) const {
  ostr << "(fun_paralel " << new_line_ << "," << point_ << "," << line_ << ")";
}

void FunParallel::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunParallel(*this);
}

ExprPtr FunParallel::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunParallel(*this);
}

// FunIntersectLL implementation

void FunIntersectLL::print(std::ostream& ostr) const {
  ostr << "(fun_intersect_ll " << new_point_ << "," << line1_ << "," << line2_ << ")";
}

void FunIntersectLL::acceptVisitor(ExpressionVisitor& visitor) const {
  visitor.visitFunIntersectLL(*this);
}

ExprPtr FunIntersectLL::acceptTransformer(ExpressionTransformer& transformer) const {
  return transformer.transformFunIntersectLL(*this);
}


// Operator overload
std::ostream& operator<<(std::ostream& os, const Expression& expr) {
    expr.print(os);
    return os;
}

std::string to_uppercase(const std::string& input) {
    std::string result(input);
    std::transform(result.begin(), result.end(), result.begin(),
        [](unsigned char c) {
            return std::toupper(c);
        });
    return result;
}
