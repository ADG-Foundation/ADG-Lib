#ifndef __ELIMINATE_FUNCTIONS_HH__
#define __ELIMINATE_FUNCTIONS_HH__

#include "expression.hh"

class EliminateFunctionsTransformer : public ExpressionTransformer {
public:
  ExprPtr transformNaryExpression(const NaryExpression& e) override;

  ExprPtr transformFunMidpoint(const FunMidpoint&) override;
  ExprPtr transformFunSegmentBisector(const FunSegmentBisector&) override;
  ExprPtr transformFunParallel(const FunParallel& e) override;
  ExprPtr transformFunPerpendicular(const FunPerpendicular& e) override;
  ExprPtr transformFunIntersectLL(const FunIntersectLL& e) override;
  ExprPtr transformFunIntersectLL_P(const FunIntersectLL_P& e) override;

  ExprPtr transformOnLine(const OnLine& e) override;
  ExprPtr transformOnParallel(const OnParallel& e) override;
  ExprPtr transformOnPerpendicular(const OnPerpendicular& e) override;
};

#endif
