#include "eliminate_functions.hh"

ExprPtr EliminateFunctionsTransformer::transformConstant(const Constant& c) {
  return std::make_shared<Constant>(c.value());
}

ExprPtr EliminateFunctionsTransformer::transformVariable(const Variable& v) {
  return std::make_shared<Variable>(v.name());
}

ExprPtr EliminateFunctionsTransformer::transformNaryExpression(const NaryExpression& e) {
  // FIXME
  return nullptr;
}

ExprPtr EliminateFunctionsTransformer::transformFreePoint(const FreePoint&) {
  // FIXME
  return nullptr;
}
ExprPtr EliminateFunctionsTransformer::transformLine(const Line&) {
  // FIXME
  return nullptr;
}
  
ExprPtr EliminateFunctionsTransformer::transformDrawPoint(const DrawPoint&) {
  // FIXME
  return nullptr;
}

ExprPtr EliminateFunctionsTransformer::transformDrawSegment(const DrawSegment&) {
  // FIXME
  return nullptr;
}
ExprPtr EliminateFunctionsTransformer::transformDrawLine(const DrawLine&) {
  // FIXME
  return nullptr;
}
ExprPtr EliminateFunctionsTransformer::transformDrawLine_P(const DrawLine_P&) {
  // FIXME
  return nullptr;
}
ExprPtr EliminateFunctionsTransformer::transformLabelPoint(const LabelPoint&) {
  // FIXME
  return nullptr;
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

ExprPtr EliminateFunctionsTransformer::transformMidpoint(const Midpoint& e) {
  return std::make_shared<Midpoint>(e.midpoint().name(), e.point1().name(), e.point2().name());
}

ExprPtr EliminateFunctionsTransformer::transformParallel_P(const Parallel_P& e) {
  return std::make_shared<Parallel_P>(e.A1().name(), e.B1().name(), e.A2().name(), e.B2().name());
}

ExprPtr EliminateFunctionsTransformer::transformPerpendicular_P(const Perpendicular_P& e) {
  return std::make_shared<Perpendicular_P>(e.A1().name(), e.B1().name(), e.A2().name(), e.B2().name());
}

ExprPtr EliminateFunctionsTransformer::transformCongruent(const Congruent& e) {
  return std::make_shared<Congruent>(e.A1().name(), e.B1().name(), e.A2().name(), e.B2().name());
}

ExprPtr EliminateFunctionsTransformer::transformCollinear(const Collinear& e) {
  return std::make_shared<Collinear>(e.A().name(), e.B().name(), e.C().name());
}
  
