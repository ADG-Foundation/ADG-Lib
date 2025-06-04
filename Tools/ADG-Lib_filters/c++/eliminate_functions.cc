#include "eliminate_functions.hh"

ExprPtr EliminateFunctionsTransformer::transformNaryExpression(const NaryExpression& e) {
  std::vector<ExprPtr> transformedOperands;
  transformedOperands.reserve(e.operands().size());
  for (ExprPtr operand : e.operands())
    transformedOperands.push_back(operand->acceptTransformer(*this));
  return std::make_shared<NaryExpression>(e.op(), transformedOperands);
}

ExprPtr EliminateFunctionsTransformer::transformFunMidpoint(const FunMidpoint& e) {
  return std::make_shared<Midpoint>(e.newPoint().name(), e.point1().name(), e.point2().name());
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

ExprPtr EliminateFunctionsTransformer::transformFunIntersectLL(const FunIntersectLL& e) {
  throw std::string("Lines should have been eliminated");
}

ExprPtr EliminateFunctionsTransformer::transformFunIntersectLL_P(const FunIntersectLL_P& e) {
  ExprPtr col1 = std::make_shared<Collinear>(e.newPoint().name(), e.A1().name(), e.B1().name());
  ExprPtr col2 = std::make_shared<Collinear>(e.newPoint().name(), e.A2().name(), e.B2().name());
  return make_expression("&", col1, col2);
}

ExprPtr EliminateFunctionsTransformer::transformOnLine(const OnLine& e) {
  return std::make_shared<Collinear>(e.X().name(), e.A().name(), e.B().name());
}

ExprPtr EliminateFunctionsTransformer::transformOnParallel(const OnParallel& e) {
  return std::make_shared<Parallel_P>(e.X().name(), e.P().name(), e.A().name(), e.B().name());
}

ExprPtr EliminateFunctionsTransformer::transformOnPerpendicular(const OnPerpendicular& e) {
  return std::make_shared<Perpendicular_P>(e.X().name(), e.P().name(), e.A().name(), e.B().name());
}
