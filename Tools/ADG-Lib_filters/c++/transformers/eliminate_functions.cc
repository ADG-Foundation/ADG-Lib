#include "eliminate_functions.hh"

ExprPtr EliminateFunctionsTransformer::transformNaryExpression(const NaryExpression& e) {
  std::vector<ExprPtr> transformedOperands;
  transformedOperands.reserve(e.operands().size());
  for (ExprPtr operand : e.operands())
    transformedOperands.push_back(operand->acceptTransformer(*this));
  return std::make_shared<NaryExpression>(e.op(), transformedOperands);
}

ExprPtr EliminateFunctionsTransformer::transformFunMidpoint(const FunMidpoint& e) {
  return std::make_shared<Midpoint>(e.X().name(), e.A().name(), e.B().name());
}

ExprPtr EliminateFunctionsTransformer::transformFunSegmentBisector(const FunSegmentBisector& e) {
  // FIXME
  return nullptr;
}

ExprPtr EliminateFunctionsTransformer::transformFunParallel(const FunParallel& e) {
  throw std::string("Lines should have been eliminated");
}

ExprPtr EliminateFunctionsTransformer::transformFunPerpendicular(const FunPerpendicular& e) {
  throw std::string("Lines should have been eliminated");
}

ExprPtr EliminateFunctionsTransformer::transformFunTranslate(const FunTranslate& e) {
  // FIXME
  throw std::string("Lines should have been eliminated");
}

ExprPtr EliminateFunctionsTransformer::transformFunIntersectLL(const FunIntersectLL& e) {
  throw std::string("Lines should have been eliminated");
}

ExprPtr EliminateFunctionsTransformer::transformFunIntersectLL_P(const FunIntersectLL_P& e) {
  ExprPtr col1 = std::make_shared<Collinear>(e.X().name(), e.A1().name(), e.B1().name());
  ExprPtr col2 = std::make_shared<Collinear>(e.X().name(), e.A2().name(), e.B2().name());
  return make_expression("&", col1, col2);
}

ExprPtr EliminateFunctionsTransformer::transformOnLine_P(const OnLine_P& e) {
  return std::make_shared<Collinear>(e.X().name(), e.A().name(), e.B().name());
}

ExprPtr EliminateFunctionsTransformer::transformOnCircle_P(const OnCircle_P& e) {
  return std::make_shared<OnCircle_P>(e.X().name(), e.O().name(), e.P().name());
}

ExprPtr EliminateFunctionsTransformer::transformOnParallel_P(const OnParallel_P& e) {
  return std::make_shared<Parallel_P>(e.X().name(), e.P().name(), e.A().name(), e.B().name());
}

ExprPtr EliminateFunctionsTransformer::transformOnPerpendicular_P(const OnPerpendicular_P& e) {
  return std::make_shared<Perpendicular_P>(e.X().name(), e.P().name(), e.A().name(), e.B().name());
}
