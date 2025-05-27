#ifndef __EXPRESSION_HPP
#define __EXPRESSION_HPP

#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include <algorithm>

// Base class for all expressions
class Expression {
public:
    virtual ~Expression() = default;
    virtual void print(std::ostream& os) const = 0;
};

using ExprPtr = std::shared_ptr<Expression>;

// Represents a constant numeric value
class Constant : public Expression {
public:
    explicit Constant(double value);
    void print(std::ostream& os) const override;
    double value() const;

private:
    double value_;
};

// Represents a variable (e.g., x, y)
class Variable : public Expression {
public:
    explicit Variable(std::string name);
    void print(std::ostream& os) const override;
    const std::string& name() const;

private:
    std::string name_;
};

typedef std::string Operator;

// Represents an n-ary expression like sum or product
class NaryExpression : public Expression {
public:
  NaryExpression(Operator op, std::vector<ExprPtr> operands);
  void print(std::ostream& os) const override;

  const std::vector<ExprPtr>& operands() const;
  Operator op() const;

private:
  Operator op_;
  bool infix_;
  std::vector<ExprPtr> operands_;
};

// Helper function to print expressions
std::ostream& operator<<(std::ostream& os, const Expression& expr);

// helper functions
std::string to_uppercase(const std::string& input);

// Helper functions for creating expressions (with variable number of arguments)
template <typename... Args>
ExprPtr make_expression(const std::string& name, const std::string& first, Args... rest) {
    std::vector<ExprPtr> operands {std::make_shared<Variable>(to_uppercase(first)), std::make_shared<Variable>(to_uppercase(rest))... };
    return std::make_shared<NaryExpression>(name, operands);
}

template <typename... Args>
ExprPtr make_expression(const std::string& name, ExprPtr first, Args... rest) {
    std::vector<ExprPtr> operands {first, rest... };
    return std::make_shared<NaryExpression>(name, operands);
}


#endif // EXPRESSION_HPP
