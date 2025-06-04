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


class FreePoint : public Expression {
public:
  FreePoint(const std::string& id, int x=0, int y=0) :
    id_(id), x_(x), y_(y) {
  }

  const std::string& id() const { return id_; }
  int x() const { return x_; }
  int y() const { return y_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  std::string id_;
  int x_, y_;
};

class Line : public Expression {
public:
  Line(const std::string& id, const std::string& point1, const std::string& point2) {
    this->id_ = id;
    this->points_[0] = point1;
    this->points_[1] = point2;
  }  

  const std::string& id() const { return id_; }
  const std::string& point1() const { return points_[0]; }
  const std::string& point2() const { return points_[1]; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  std::string id_;
  std::string points_[2];
};



// Represents a command that draws a point (without a label)
class DrawPoint : public Expression {
public:
  DrawPoint(const std::string& point) :
    point_(Variable(point)) {
  }

  const Variable& point() const { return point_; }
      
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable point_;
};

// Represents a command that draws a point (without a label)
class LabelPoint : public Expression {
public:
  LabelPoint(const std::string& point) :
    point_(Variable(point)) {
  }

  const Variable& point() const { return point_; }
      
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable point_;
};


enum DrawingStyle {SOLID, DASHED, BOLD};

// Represents a command that draws a segment
class DrawSegment : public Expression {
public:
  
  DrawSegment(const std::string& point1, const std::string& point2, DrawingStyle style = SOLID) :
    point1_(Variable(point1)), point2_(Variable(point2)) {
  }

  const Variable& point1() const { return point1_; }
  const Variable& point2() const { return point2_; }
  const DrawingStyle& style() const { return style_; }
    
  
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable point1_, point2_;
  DrawingStyle style_;
};

// Represents a command that draws a line
class DrawLine : public Expression {
public:
  
  DrawLine(const std::string& line, DrawingStyle style = SOLID) :
    line_(Variable(line)) {
  }

  const Variable& line() const { return line_; }
  const DrawingStyle& style() const { return style_; }
    
  
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable line_;
  DrawingStyle style_;
};

// Represents a command that draws a line given by two points
class DrawLine_P : public Expression {
public:
  
  DrawLine_P(const std::string& point1, const std::string& point2, DrawingStyle style = SOLID) :
    point1_(Variable(point1)), point2_(Variable(point2)) {
  }

  const Variable& point1() const { return point1_; }
  const Variable& point2() const { return point2_; }
  const DrawingStyle& style() const { return style_; }
    
  
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable point1_, point2_;
  DrawingStyle style_;
};



// Represents a function that constructs the midpoint of a segment
class FunMidpoint : public Expression {
public:
  FunMidpoint(const std::string& new_point, const std::string& point1, const std::string& point2)
    : new_point_(Variable(new_point)), point1_(Variable(point1)), point2_(Variable(point2)) {
  }

  const Variable& newPoint() const { return new_point_; }
  const Variable& point1() const { return point1_; }
  const Variable& point2() const { return point2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable new_point_, point1_, point2_;
};

// Represents a predicate that checks if the given point is the midpoint of a segment
class Midpoint : public Expression {
public:
  Midpoint(const std::string& midpoint, const std::string& point1, const std::string& point2)
    : midpoint_(Variable(midpoint)), point1_(Variable(point1)), point2_(Variable(point2)) {
  }

  const Variable& midpoint() const { return midpoint_; }
  const Variable& point1() const { return point1_; }
  const Variable& point2() const { return point2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable midpoint_, point1_, point2_;
};

// Represents a predicate that checks if the two segments given by
// pairs of points are congruent
class Congruent : public Expression {
public:
  Congruent(const std::string& A1, const std::string& B1,
            const std::string& A2, const std::string& B2)
    : A1_(Variable(A1)), B1_(Variable(B1)),
      A2_(Variable(A2)), B2_(Variable(B2)) {
  }

  const Variable& A1() const { return A1_; }
  const Variable& B1() const { return B1_; }
  const Variable& A2() const { return A2_; }
  const Variable& B2() const { return B2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable A1_, B1_, A2_, B2_;
};

// Represents a predicate that checks if the points are collinear
class Collinear : public Expression {
public:
  Collinear(const std::string& A, const std::string& B, const std::string& C)
    : A_(Variable(A)), B_(Variable(B)), C_(Variable(C)) {
  }

  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }
  const Variable& C() const { return C_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable A_, B_, C_;
};


// Represents a predicate that checks if the lines given by two pairs of points are parallel
class Parallel_P : public Expression {
public:
  Parallel_P(const std::string& A1, const std::string& B1, const std::string& A2, const std::string& B2)
    : A1_(Variable(A1)), B1_(Variable(B1)), A2_(Variable(A2)), B2_(Variable(B2)) {
  }

  const Variable& A1() const { return A1_; }
  const Variable& B1() const { return B1_; }
  const Variable& A2() const { return A2_; }
  const Variable& B2() const { return B2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable A1_, B1_, A2_, B2_;
};

// Represents a predicate that checks if the lines given by two pairs
// of points are perpendicular
class Perpendicular_P : public Expression {
public:
  Perpendicular_P(const std::string& A1, const std::string& B1, const std::string& A2, const std::string& B2)
    : A1_(Variable(A1)), B1_(Variable(B1)), A2_(Variable(A2)), B2_(Variable(B2)) {
  }

  const Variable& A1() const { return A1_; }
  const Variable& B1() const { return B1_; }
  const Variable& A2() const { return A2_; }
  const Variable& B2() const { return B2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable A1_, B1_, A2_, B2_;
};


// Represents a function that constructs the perpendicular bisector of a segment
class FunSegmentBisector : public Expression {
public:
  FunSegmentBisector(const std::string& new_line, const std::string& point1, const std::string& point2)
    : new_line_(Variable(new_line)), point1_(Variable(point1)), point2_(Variable(point2)) {
  }

  const Variable& newLine() const { return new_line_; }
  const Variable& point1() const { return point1_; }
  const Variable& point2() const { return point2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable new_line_, point1_, point2_;
};


// Rrepresents a line parallel to the given line through a given point
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

// Rrepresents a line perpendicular to the given line through a given point
class FunPerpendicular : public Expression {
public:
  FunPerpendicular(const std::string& new_line, const std::string& point, const std::string& line)
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


// Represents the point that is the intersection of two lines
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

class FunIntersectLL_P : public Expression {
public:
  FunIntersectLL_P(const std::string& new_point,
                   const std::string& A1, const std::string& B1,
                   const std::string& A2, const std::string& B2)
    : new_point_(Variable(new_point)),
      A1_(Variable(A1)), B1_(Variable(B1)),
      A2_(Variable(A2)), B2_(Variable(B2))
  {}

  const Variable& newPoint() const { return new_point_; }
  const Variable& A1() const { return A1_; }
  const Variable& B1() const { return B1_; }
  const Variable& A2() const { return A2_; }
  const Variable& B2() const { return B2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable new_point_, A1_, B1_, A2_, B2_;
};

class OnLine: public Expression {
public:
  OnLine(const std::string& X, const std::string& A, const std::string& B) :
    X_(Variable(X)), A_(Variable(A)), B_(Variable(B)) {
  }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
  const Variable& X() const { return X_; }
  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }
private:
  Variable X_, A_, B_;
};


class OnParallel: public Expression {
public:
  OnParallel(const std::string& X,
             const std::string& A, const std::string& B,
             const std::string& P) :
    X_(Variable(X)), A_(Variable(A)), B_(Variable(B)), P_(Variable(P)) {
  }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
  const Variable& X() const { return X_; }
  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }
  const Variable& P() const { return P_; }
private:
  Variable X_, A_, B_, P_;
};

class OnPerpendicular: public Expression {
public:
  OnPerpendicular(const std::string& X,
                  const std::string& A, const std::string& B,
                  const std::string& P) :
    X_(Variable(X)), A_(Variable(A)), B_(Variable(B)), P_(Variable(P)) {
  }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
  const Variable& X() const { return X_; }
  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }
  const Variable& P() const { return P_; }
private:
  Variable X_, A_, B_, P_;
};


// Base class for expression visitors
class ExpressionVisitor {
public:
  virtual void visitFreePoint(const FreePoint&) = 0;
  virtual void visitLine(const Line&) = 0;
  
  virtual void visitConstant(const Constant&) = 0;
  virtual void visitVariable(const Variable&) = 0;
  virtual void visitNaryExpression(const NaryExpression&) = 0;
  
  virtual void visitDrawPoint(const DrawPoint&) = 0;
  virtual void visitDrawSegment(const DrawSegment&) = 0;
  virtual void visitDrawLine(const DrawLine&) = 0;
  virtual void visitDrawLine_P(const DrawLine_P&) = 0;
  virtual void visitLabelPoint(const LabelPoint&) = 0;
  
  virtual void visitFunMidpoint(const FunMidpoint&) = 0;
  virtual void visitFunSegmentBisector(const FunSegmentBisector&) = 0;
  virtual void visitFunParallel(const FunParallel&) = 0;
  virtual void visitFunPerpendicular(const FunPerpendicular&) = 0;
  virtual void visitFunIntersectLL(const FunIntersectLL&) = 0;
  virtual void visitFunIntersectLL_P(const FunIntersectLL_P&) = 0;

  virtual void visitOnLine(const OnLine&) = 0;
  virtual void visitOnParallel(const OnParallel&) = 0;
  virtual void visitOnPerpendicular(const OnPerpendicular&) = 0;

  virtual void visitMidpoint(const Midpoint&) = 0;
  virtual void visitParallel_P(const Parallel_P&) = 0;
  virtual void visitPerpendicular_P(const Perpendicular_P&) = 0;
  virtual void visitCongruent(const Congruent&) = 0;
  virtual void visitCollinear(const Collinear&) = 0;
  
  virtual ~ExpressionVisitor() = default;
};

// Base class for expression transformers
class ExpressionTransformer {
public:
  virtual ExprPtr transformConstant(const Constant&) = 0;
  virtual ExprPtr transformVariable(const Variable&) = 0;
  virtual ExprPtr transformNaryExpression(const NaryExpression&) = 0;

  virtual ExprPtr transformFreePoint(const FreePoint&) = 0;
  virtual ExprPtr transformLine(const Line&) = 0;
  
  virtual ExprPtr transformDrawPoint(const DrawPoint&) = 0;
  virtual ExprPtr transformDrawSegment(const DrawSegment&) = 0;
  virtual ExprPtr transformDrawLine(const DrawLine&) = 0;
  virtual ExprPtr transformDrawLine_P(const DrawLine_P&) = 0;
  virtual ExprPtr transformLabelPoint(const LabelPoint&) = 0;
  
  virtual ExprPtr transformFunMidpoint(const FunMidpoint&) = 0;
  virtual ExprPtr transformFunSegmentBisector(const FunSegmentBisector&) = 0;
  virtual ExprPtr transformFunParallel(const FunParallel&) = 0;
  virtual ExprPtr transformFunPerpendicular(const FunPerpendicular&) = 0;
  virtual ExprPtr transformFunIntersectLL(const FunIntersectLL&) = 0;
  virtual ExprPtr transformFunIntersectLL_P(const FunIntersectLL_P&) = 0;

  virtual ExprPtr transformOnLine(const OnLine&) = 0;
  virtual ExprPtr transformOnParallel(const OnParallel&) = 0;
  virtual ExprPtr transformOnPerpendicular(const OnPerpendicular&) = 0;

  virtual ExprPtr transformMidpoint(const Midpoint&) = 0;
  virtual ExprPtr transformParallel_P(const Parallel_P&) = 0;
  virtual ExprPtr transformPerpendicular_P(const Perpendicular_P&) = 0;
  virtual ExprPtr transformCongruent(const Congruent&) = 0;
  virtual ExprPtr transformCollinear(const Collinear&) = 0;
  
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
    return "X_" + std::to_string(instance.num++);
  }
};

class AuxiliaryLines {
private:
  // Private constructor
  AuxiliaryLines() = default;
  
  int num = 0;
  
public:
  // Delete copy constructor and assignment to enforce singleton
  AuxiliaryLines(const AuxiliaryLines&) = delete;
  AuxiliaryLines& operator=(const AuxiliaryLines&) = delete;
  
  static std::string get() {
    static AuxiliaryLines instance;
    return "l_" + std::to_string(instance.num++);
  }
};

class AuxiliaryObjects {
private:
  // Private constructor
  AuxiliaryObjects() = default;
  
  int num = 0;
  
public:
  // Delete copy constructor and assignment to enforce singleton
  AuxiliaryObjects(const AuxiliaryObjects&) = delete;
  AuxiliaryObjects& operator=(const AuxiliaryObjects&) = delete;
  
  static std::string get() {
    static AuxiliaryObjects instance;
    return "obj_" + std::to_string(instance.num++);
  }
};

#endif // EXPRESSION_HPP
