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
  Constant(const Constant&) = default;
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
  Variable(const Variable&) = default;
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
  NaryExpression(Operator op, ExprPtr op1, ExprPtr op2);
  NaryExpression(const NaryExpression&) = default;
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;

  const std::vector<ExprPtr>& operands() const;
  Operator op() const;

private:
  void setInfix(Operator op);
  
  Operator op_;
  bool infix_;
  std::vector<ExprPtr> operands_;
};

class Point {
public:
  Point(const std::string& id, double x=0.0, double y=0.0) :
    id_(id), x_(x), y_(y) {
  }
  Point(const Point&) = default;

  const std::string& id() const { return id_; }
  double x() const { return x_; }
  double y() const { return y_; }
  
private:
  std::string id_;
  double x_, y_;
};

class FreePoint : public Point, public Expression {
public:
  FreePoint(const std::string& id, int x=0, int y=0) :
    Point(id, x, y) {
  }
  FreePoint(const FreePoint& other) = default;
  
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
};

class Line : public Expression {
public:
  Line(const std::string& id, const std::string& point1, const std::string& point2) {
    this->id_ = id;
    this->points_[0] = point1;
    this->points_[1] = point2;
  }  
  Line(const Line&) = default;

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
  DrawPoint(const std::string& A) :
    A_(Variable(A)) {
  }
  DrawPoint(const DrawPoint&) = default;

  const Variable& A() const { return A_; }
      
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable A_;
};

// Represents a command that draws a point (without a label)
class LabelPoint : public Expression {
public:
  LabelPoint(const std::string& A) :
    A_(Variable(A)) {
  }
  LabelPoint(const LabelPoint&) = default;

  const Variable& A() const { return A_; }
      
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable A_;
};


enum DrawingStyle {SOLID, DASHED, BOLD};

// Represents a command that draws a segment
class DrawSegment : public Expression {
public:
  
  DrawSegment(const std::string& A, const std::string& B, DrawingStyle style = SOLID) :
    A_(Variable(A)), B_(Variable(B)) {
  }
  DrawSegment(const DrawSegment&) = default;

  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }
  const DrawingStyle& style() const { return style_; }
    
  
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable A_, B_;
  DrawingStyle style_;
};

// Represents a command that draws a line
class DrawLine : public Expression {
public:  
  DrawLine(const std::string& l, DrawingStyle style = SOLID) :
    l_(Variable(l)) {
  }
  DrawLine(const DrawLine&) = default;

  const Variable& l() const { return l_; }
  const DrawingStyle& style() const { return style_; }
  
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable l_;
  DrawingStyle style_;
};

// Represents a command that draws a circle
class DrawCircle : public Expression {
public:
  DrawCircle(const std::string& c, DrawingStyle style = SOLID) :
    c_(Variable(c)) {
  }
  DrawCircle(const DrawCircle&) = default;

  const Variable& c() const { return c_; }
  const DrawingStyle& style() const { return style_; }
    
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable c_;
  DrawingStyle style_;
};

// Represents a command that draws a line given by two points
class DrawLine_P : public Expression {
public:  
  DrawLine_P(const std::string& A, const std::string& B, DrawingStyle style = SOLID) :
    A_(Variable(A)), B_(Variable(B)) {
  }

  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }
  const DrawingStyle& style() const { return style_; }
  
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable A_, B_;
  DrawingStyle style_;
};

// Represents a command that draws a circle given by the center and a point
class DrawCircle_P : public Expression {
public:
  DrawCircle_P(const std::string& O, const std::string& A, DrawingStyle style = SOLID) :
    O_(Variable(O)), A_(Variable(A)) {
  }

  const Variable& O() const { return O_; }
  const Variable& A() const { return A_; }
  const DrawingStyle& style() const { return style_; }
    
  
  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable O_, A_;
  DrawingStyle style_;
};


// Represents a function that constructs the midpoint of a segment
class FunMidpoint : public Expression {
public:
  FunMidpoint(const std::string& X, const std::string& A, const std::string& B)
    : X_(Variable(X)), A_(Variable(A)), B_(Variable(B)) {
  }
  FunMidpoint(const FunMidpoint&) = default;

  const Variable& X() const { return X_; }
  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable X_, A_, B_;
};

// Represents a predicate that checks if the given point is the midpoint of a segment
class Midpoint : public Expression {
public:
  Midpoint(const std::string& X, const std::string& A, const std::string& B)
    : X_(Variable(X)), A_(Variable(A)), B_(Variable(B)) {
  }
  Midpoint(const Midpoint&) = default;

  const Variable& X() const { return X_; }
  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable X_, A_, B_;
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

// Represents a predicate that checks if the lines given by two pairs of points are parallel, allowing that pairs of points are the same (degenerate case)
class ParallelDG_P : public Expression {
public:
  ParallelDG_P(const std::string& A1, const std::string& B1, const std::string& A2, const std::string& B2)
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

// Represents a predicate that checks if the lines given by two pairs
// of points are perpendicular, allowing that points are equal (degenerate case)
class PerpendicularDG_P : public Expression {
public:
  PerpendicularDG_P(const std::string& A1, const std::string& B1, const std::string& A2, const std::string& B2)
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


// Represents equality of two terms
class Equal : public NaryExpression {
public:
  Equal(ExprPtr op1, ExprPtr op2) : NaryExpression("=", op1, op2) {
  }

  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
};

// Represents equality of two points
class Identical : public Expression {
public:
  Identical(const std::string& A, const std::string& B) :
    A_(Variable(A)), B_(Variable(B)) {
  }
  Identical(const Identical&) = default;

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;

  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }
  
private:
  Variable A_, B_;
};

// Represents that 4 points are harmonically conjugated
class Harmonic : public Expression {
public:
  Harmonic(const std::string& A, const std::string& B, const std::string& C, const std::string& D) :
    A_(Variable(A)), B_(Variable(B)), C_(Variable(C)), D_(Variable(D)) {
  }
  Harmonic(const Harmonic&) = default;
  
  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }
  const Variable& C() const { return C_; }
  const Variable& D() const { return D_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable A_, B_, C_, D_;
};


// Represents a function that constructs the perpendicular bisector of a segment
class FunSegmentBisector : public Expression {
public:
  FunSegmentBisector(const std::string& x, const std::string& A, const std::string& B)
    : x_(Variable(x)), A_(Variable(A)), B_(Variable(B)) {
  }

  const Variable& x() const { return x_; }
  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable x_, A_, B_;
};


// Rrepresents a line parallel to the given line through a given point
class FunParallel : public Expression {
public:
  FunParallel(const std::string& x, const std::string& A, const std::string& l)
    : x_(Variable(x)), A_(Variable(A)), l_(Variable(l)) {
  }

  const Variable& x() const { return x_; }
  const Variable& A() const { return A_; }
  const Variable& l() const { return l_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable x_, A_, l_;
};

// Rrepresents a line perpendicular to the given line through a given point
class FunPerpendicular : public Expression {
public:
  FunPerpendicular(const std::string& x, const std::string& A, const std::string& l)
    : x_(Variable(x)), A_(Variable(A)), l_(Variable(l)) {
  }

  const Variable& x() const { return x_; }
  const Variable& A() const { return A_; }
  const Variable& l() const { return l_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable x_, A_, l_;
};

// Rrepresents a line perpendicular to the given line through a given point
class FunPerpendicular_P : public Expression {
public:
  FunPerpendicular_P(const std::string& x, const std::string& A, const std::string& B, const std::string& P)
    : x_(Variable(x)), P_(Variable(P)), A_(Variable(A)), B_(Variable(B)) {
  }

  const Variable& x() const { return x_; }
  const Variable& A() const { return A_; }
  const Variable& B() const { return B_; }
  const Variable& P() const { return P_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable x_, A_, B_, P_;
};


// Represents the point that is the intersection of two lines
class FunIntersectLL : public Expression {
public:
  FunIntersectLL(const std::string& X, const std::string& l1, const std::string& l2)
    : X_(Variable(X)), l1_(Variable(l1)), l2_(Variable(l2)) {
  }

  const Variable& X() const { return X_; }
  const Variable& l1() const { return l1_; }
  const Variable& l2() const { return l2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable X_, l1_, l2_;
};

class FunIntersectLL_P : public Expression {
public:
  FunIntersectLL_P(const std::string& X,
                   const std::string& A1, const std::string& B1,
                   const std::string& A2, const std::string& B2)
    : X_(Variable(X)),
      A1_(Variable(A1)), B1_(Variable(B1)),
      A2_(Variable(A2)), B2_(Variable(B2))
  {}

  const Variable& X() const { return X_; }
  const Variable& A1() const { return A1_; }
  const Variable& B1() const { return B1_; }
  const Variable& A2() const { return A2_; }
  const Variable& B2() const { return B2_; }

  void print(std::ostream&) const override;
  void acceptVisitor(ExpressionVisitor&) const override;
  ExprPtr acceptTransformer(ExpressionTransformer&) const override;
  
private:
  Variable X_, A1_, B1_, A2_, B2_;
};

class OnLine_P: public Expression {
public:
  OnLine_P(const std::string& X, const std::string& A, const std::string& B) :
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


class OnParallel_P: public Expression {
public:
  OnParallel_P(const std::string& X,
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

class OnPerpendicular_P: public Expression {
public:
  OnPerpendicular_P(const std::string& X,
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
  virtual void visitFunPerpendicular_P(const FunPerpendicular_P&) = 0;
  virtual void visitFunIntersectLL(const FunIntersectLL&) = 0;
  virtual void visitFunIntersectLL_P(const FunIntersectLL_P&) = 0;

  virtual void visitOnLine_P(const OnLine_P&) = 0;
  virtual void visitOnParallel_P(const OnParallel_P&) = 0;
  virtual void visitOnPerpendicular_P(const OnPerpendicular_P&) = 0;

  virtual void visitMidpoint(const Midpoint&) = 0;
  virtual void visitParallel_P(const Parallel_P&) = 0;
  virtual void visitParallelDG_P(const ParallelDG_P&) = 0;
  virtual void visitPerpendicular_P(const Perpendicular_P&) = 0;
  virtual void visitPerpendicularDG_P(const PerpendicularDG_P&) = 0;
  virtual void visitCongruent(const Congruent&) = 0;
  virtual void visitCollinear(const Collinear&) = 0;
  virtual void visitEqual(const Equal& e) = 0;
  virtual void visitIdentical(const Identical& e) = 0;
  virtual void visitHarmonic(const Harmonic& e) = 0;
  
  virtual ~ExpressionVisitor() = default;
};

// Base class for expression transformers
class ExpressionTransformer {
public:
  virtual ExprPtr transformConstant(const Constant& e) {
    return std::make_shared<Constant>(e);
  }
  
  virtual ExprPtr transformVariable(const Variable& e) {
    return std::make_shared<Variable>(e);
  }
  
  virtual ExprPtr transformNaryExpression(const NaryExpression& e) {
    return std::make_shared<NaryExpression>(e);
  }

  virtual ExprPtr transformFreePoint(const FreePoint& e) {
    return std::make_shared<FreePoint>(e);
  }
  
  virtual ExprPtr transformLine(const Line& e) {
    return std::make_shared<Line>(e);
  }
  
  virtual ExprPtr transformDrawPoint(const DrawPoint& e) {
    return std::make_shared<DrawPoint>(e);
  }
  
  virtual ExprPtr transformDrawSegment(const DrawSegment& e) {
    return std::make_shared<DrawSegment>(e);
  }
  
  virtual ExprPtr transformDrawLine(const DrawLine& e) {
    return std::make_shared<DrawLine>(e);
  }
  
  virtual ExprPtr transformDrawLine_P(const DrawLine_P& e) {
    return std::make_shared<DrawLine_P>(e);
  }
  
  virtual ExprPtr transformLabelPoint(const LabelPoint& e) {
    return std::make_shared<LabelPoint>(e);
  }
  
  virtual ExprPtr transformFunMidpoint(const FunMidpoint& e) {
    return std::make_shared<FunMidpoint>(e);
  }
  
  virtual ExprPtr transformFunSegmentBisector(const FunSegmentBisector& e) {
    return std::make_shared<FunSegmentBisector>(e);
  }
  
  virtual ExprPtr transformFunParallel(const FunParallel& e) {
    return std::make_shared<FunParallel>(e);
  }
  
  virtual ExprPtr transformFunPerpendicular(const FunPerpendicular& e) {
    return std::make_shared<FunPerpendicular>(e);
  }

  virtual ExprPtr transformFunPerpendicular_P(const FunPerpendicular_P& e) {
    return std::make_shared<FunPerpendicular_P>(e);
  }
  
  
  virtual ExprPtr transformFunIntersectLL(const FunIntersectLL& e) {
    return std::make_shared<FunIntersectLL>(e);
  }
  
  virtual ExprPtr transformFunIntersectLL_P(const FunIntersectLL_P& e) {
    return std::make_shared<FunIntersectLL_P>(e);
  }

  virtual ExprPtr transformOnLine_P(const OnLine_P& e) {
    return std::make_shared<OnLine_P>(e);
  }
  
  virtual ExprPtr transformOnParallel_P(const OnParallel_P& e) {
    return std::make_shared<OnParallel_P>(e);
  }
  
  virtual ExprPtr transformOnPerpendicular_P(const OnPerpendicular_P& e) {
    return std::make_shared<OnPerpendicular_P>(e);
  }

  virtual ExprPtr transformMidpoint(const Midpoint& e) {
    return std::make_shared<Midpoint>(e);
  }
  
  virtual ExprPtr transformParallel_P(const Parallel_P& e) {
    return std::make_shared<Parallel_P>(e);
  }
  
  virtual ExprPtr transformParallelDG_P(const ParallelDG_P& e) {
    return std::make_shared<ParallelDG_P>(e);
  }
  
  virtual ExprPtr transformPerpendicular_P(const Perpendicular_P& e) {
    return std::make_shared<Perpendicular_P>(e);
  }
  
  virtual ExprPtr transformPerpendicularDG_P(const PerpendicularDG_P& e) {
    return std::make_shared<PerpendicularDG_P>(e);
  }
  
  virtual ExprPtr transformCongruent(const Congruent& e) {
    return std::make_shared<Congruent>(e);
  }
  
  virtual ExprPtr transformCollinear(const Collinear& e) {
    return std::make_shared<Collinear>(e);
  }
  
  virtual ExprPtr transformEqual(const Equal& e) {
    return std::make_shared<Equal>(e);
  }

  virtual ExprPtr transformIdentical(const Identical& e) {
    return std::make_shared<Identical>(e);
  }

  virtual ExprPtr transformHarmonic(const Harmonic& e) {
    return std::make_shared<Harmonic>(e);
  }
  
  
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
