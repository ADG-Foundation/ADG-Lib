#ifndef __ELIMINATE_FUNCTIONS_HH__
#define __ELIMINATE_FUNCTIONS_HH__

#include "expression.hh"

class EliminateFunctionsTransformer : public ExpressionTransformer {
public:
  ExprPtr transformConstant(const Constant&) override;
  ExprPtr transformVariable(const Variable&) override;
  ExprPtr transformNaryExpression(const NaryExpression& e) override;

  ExprPtr transformFreePoint(const FreePoint&) override;
  ExprPtr transformLine(const Line&) override;
  
  ExprPtr transformDrawPoint(const DrawPoint&) override;
  ExprPtr transformDrawSegment(const DrawSegment&) override;
  ExprPtr transformDrawLine(const DrawLine&) override;
  ExprPtr transformDrawLine_P(const DrawLine_P&) override;
  ExprPtr transformLabelPoint(const LabelPoint&) override;
  
  ExprPtr transformFunMidpoint(const FunMidpoint&) override;
  ExprPtr transformFunSegmentBisector(const FunSegmentBisector&) override;
  ExprPtr transformFunParallel(const FunParallel& e) override;
  ExprPtr transformFunPerpendicular(const FunPerpendicular& e) override;
  ExprPtr transformFunIntersectLL(const FunIntersectLL& e) override;
  ExprPtr transformFunIntersectLL_P(const FunIntersectLL_P& e) override;

  ExprPtr transformOnLine(const OnLine& e) override;
  ExprPtr transformOnParallel(const OnParallel& e) override;
  ExprPtr transformOnPerpendicular(const OnPerpendicular& e) override;

  ExprPtr transformMidpoint(const Midpoint&) override;
  ExprPtr transformParallel_P(const Parallel_P&) override;
  ExprPtr transformPerpendicular_P(const Perpendicular_P&) override;
  ExprPtr transformCongruent(const Congruent&) override;
  ExprPtr transformCollinear(const Collinear&) override;
};

#endif
