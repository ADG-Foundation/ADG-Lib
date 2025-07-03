#include "eliminate_functions.hh"

ExprPtr EliminateFunctionsTransformer::transformNaryExpression(const NaryExpression& e) {
  std::vector<ExprPtr> transformedOperands;
  transformedOperands.reserve(e.operands().size());
  for (ExprPtr operand : e.operands())
    transformedOperands.push_back(operand->acceptTransformer(*this));
  return std::make_shared<NaryExpression>(e.op(), transformedOperands);
}

ExprPtr EliminateFunctionsTransformer::transformFunTowards(const FunTowards& e) {
  return std::make_shared<Towards>(e.X().name(), e.A().name(), e.B().name(), e.R().value());
}


ExprPtr EliminateFunctionsTransformer::transformFunFoot(const FunFoot& e) {
  return std::make_shared<Foot>(e.X().name(), e.P().name(), e.p().name());
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


ExprPtr EliminateFunctionsTransformer::transformFunIntersectLC(const FunIntersectLC& e) {
  throw std::string("Lines should have been eliminated");
}

ExprPtr EliminateFunctionsTransformer::transformFunIntersectLC_P(const FunIntersectLC_P& e) {
  ExprPtr col1 = std::make_shared<Collinear>(e.X1().name(), e.A().name(), e.B().name());
  ExprPtr oncircle1 = std::make_shared<OnCircle_P>(e.X2().name(), e.O().name(), e.P().name());
  ExprPtr col2 = std::make_shared<Collinear>(e.X2().name(), e.A().name(), e.B().name());
  ExprPtr oncircle2 = std::make_shared<OnCircle_P>(e.X2().name(), e.O().name(), e.P().name());
  return make_expression("&", col1, make_expression("&", oncircle1, make_expression("&", col2, oncircle2)));
}


ExprPtr EliminateFunctionsTransformer::transformFunIntersectCC(const FunIntersectCC& e) {
  throw std::string("Lines should have been eliminated");
}

ExprPtr EliminateFunctionsTransformer::transformFunIntersectCC_P(const FunIntersectCC_P& e) {
  ExprPtr oncircle11 = std::make_shared<OnCircle_P>(e.X1().name(), e.O1().name(), e.P1().name());
  ExprPtr oncircle12 = std::make_shared<OnCircle_P>(e.X1().name(), e.O2().name(), e.P2().name());
  ExprPtr oncircle21 = std::make_shared<OnCircle_P>(e.X1().name(), e.O1().name(), e.P1().name());
  ExprPtr oncircle22 = std::make_shared<OnCircle_P>(e.X1().name(), e.O2().name(), e.P2().name());
  return make_expression("&", oncircle11, make_expression("&", oncircle12, make_expression("&", oncircle21, oncircle22)));
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
