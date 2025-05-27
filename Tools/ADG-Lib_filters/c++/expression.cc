#include "expression.hh"

// Constant implementation
Constant::Constant(double value) : value_(value) {}

void Constant::print(std::ostream& os) const {
    os << value_;
}

double Constant::value() const {
    return value_;
}

// Variable implementation
Variable::Variable(std::string name) : name_(std::move(name)) {}

void Variable::print(std::ostream& os) const {
    os << name_;
}

const std::string& Variable::name() const {
    return name_;
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
