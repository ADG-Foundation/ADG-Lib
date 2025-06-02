#ifndef __EXPRESSION_HPP
#define __EXPRESSION_HPP

#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include <algorithm>

// Forward declaration to avoid circular dependencies
class Expression;
class ExpressionVisitor;
class ExpressionTransformer;

using ExprPtr = std::shared_ptr<Expression>;

// Base class for all expressions
class Expression {
public:
  virtual ~Expression() = default;
  virtual void print(std::ostream&) const = 0;
  virtual void acceptVisitor(ExpressionVisitor&) const = 0;
  virtual ExprPtr acceptTransformer(ExpressionTransformer&) const = 0;
};


// Represents a constant numeric value
class Constant : public Expression {
public:
  explicit Constant(double value);
  void print(std::ostream&) const override;
  double value() const;
  void acceptVisitor(ExpressionVisitor&) const;
  ExprPtr acceptTransformer(ExpressionTransformer&) const;

private:
  double value_;
};

// Represents a variable (e.g., x, y)
class Variable : public Expression {
public:
  explicit Variable(std::string name);
  void print(std::ostream& os) const override;
  const std::string& name() const;
  void acceptVisitor(ExpressionVisitor& visitor) const;
  ExprPtr acceptTransformer(ExpressionTransformer&) const;

private:
  std::string name_;
};

typedef std::string Operator;

// Represents an n-ary expression like sum or product
class NaryExpression : public Expression {
public:
  NaryExpression(Operator op, std::vector<ExprPtr> operands);
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;

  const std::vector<ExprPtr>& operands() const;
  Operator op() const;

private:
  Operator op_;
  bool infix_;
  std::vector<ExprPtr> operands_;
};


class FunParallel : public Expression {
public:
  FunParallel(const std::string& new_line, const std::string& point, const std::string& line)
    : new_line_(Variable(new_line)), point_(Variable(point)), line_(Variable(line)) {
  }

  const Variable& newLine() const { return new_line_; }
  const Variable& point() const { return point_; }
  const Variable& line() const { return line_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable new_line_, point_, line_;
};


class FunIntersectLL : public Expression {
public:
  FunIntersectLL(const std::string& new_point, const std::string& line1, const std::string& line2)
    : new_point_(Variable(new_point)), line1_(Variable(line1)), line2_(Variable(line2)) {
  }

  const Variable& newPoint() const { return new_point_; }
  const Variable& line1() const { return line1_; }
  const Variable& line2() const { return line2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable new_point_, line1_, line2_;
};



// Base class for expression visitors
class ExpressionVisitor {
public:
  virtual void visitConstant(const Constant&) = 0;
  virtual void visitVariable(const Variable&) = 0;
  virtual void visitNaryExpression(const NaryExpression&) = 0;
  
  virtual void visitFunParallel(const FunParallel&) = 0;
  virtual void visitFunIntersectLL(const FunIntersectLL&) = 0;

  
  virtual ~ExpressionVisitor() = default;
};

// Base class for expression transformers
class ExpressionTransformer {
public:
  virtual ExprPtr transformConstant(const Constant&) = 0;
  virtual ExprPtr transformVariable(const Variable&) = 0;
  virtual ExprPtr transformNaryExpression(const NaryExpression&) = 0;
  
  virtual ExprPtr transformFunParallel(const FunParallel&) = 0;
  virtual ExprPtr transformFunIntersectLL(const FunIntersectLL&) = 0;
  
  virtual ~ExpressionTransformer() = default;
};



// Helper function to print expressions
std::ostream& operator<<(std::ostream& os, const Expression& expr);

// helper functions
std::string to_uppercase(const std::string& input);

// Helper functions for creating expressions (with variable number of arguments)
template <typename... Args>
ExprPtr make_expression(const std::string& name, const std::string& first, Args... rest) {
    std::vector<ExprPtr> operands {std::make_shared<Variable>(first), std::make_shared<Variable>(rest)... };
    return std::make_shared<NaryExpression>(name, operands);
}

template <typename... Args>
ExprPtr make_expression(const std::string& name, ExprPtr first, Args... rest) {
    std::vector<ExprPtr> operands {first, rest... };
    return std::make_shared<NaryExpression>(name, operands);
}


struct Line {
  std::string id;
  std::string points[2];
  Line(const std::string& id, const std::string& point1, const std::string& point2) {
    this->id = id;
    this->points[0] = point1;
    this->points[1] = point2;
  }
};

class AuxiliaryPoints {
private:
  // Private constructor
  AuxiliaryPoints() = default;
  
  int num = 0;
  
public:
  // Delete copy constructor and assignment to enforce singleton
  AuxiliaryPoints(const AuxiliaryPoints&) = delete;
  AuxiliaryPoints& operator=(const AuxiliaryPoints&) = delete;
  
  static std::string get() {
    static AuxiliaryPoints instance;
    return "X" + std::to_string(instance.num++);
  }
};

#endif // EXPRESSION_HPP
