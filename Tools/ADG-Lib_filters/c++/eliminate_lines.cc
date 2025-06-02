#include "eliminate_lines.hh"


ExprPtr EliminateLinesTransformer::transformConstant(const Constant& c) {
  return std::make_shared<Constant>(c.value());
}

ExprPtr EliminateLinesTransformer::transformVariable(const Variable& v) {
    return std::make_shared<Variable>(v.name());
}

ExprPtr EliminateLinesTransformer::transformNaryExpression(const NaryExpression& e) {
  std::vector<ExprPtr> operands;
  for (ExprPtr op : e.operands())
    operands.push_back(op->acceptTransformer(*this));
  return std::make_shared<NaryExpression>(e.op(), operands);
}


ExprPtr EliminateLinesTransformer::transformFreePoint(const FreePoint& e) {
  return std::make_shared<FreePoint>(e.id(), e.x(), e.y());
}

ExprPtr EliminateLinesTransformer::transformLine(const Line&) {
  return nullptr;
}

ExprPtr EliminateLinesTransformer::transformDrawPoint(const DrawPoint& e) {
  return std::make_shared<DrawPoint>(e.point().name());
}

ExprPtr EliminateLinesTransformer::transformDrawSegment(const DrawSegment& e) {
  return std::make_shared<DrawSegment>(e.point1().name(), e.point2().name());
}

ExprPtr EliminateLinesTransformer::transformFunMidpoint(const FunMidpoint& e) {
  return std::make_shared<FunMidpoint>(e.newPoint().name(), e.point1().name(), e.point2().name());
}

// l2 = fun_parallel(A', l1)
ExprPtr EliminateLinesTransformer::transformFunParallel(const FunParallel& e) {
  std::string lineId  = e.line().name();
  auto it1 = lines.find(lineId);
  if (it1 == lines.end())
    throw std::string("Line ") + lineId + std::string("not found");
  else {
    // A B   A'  
    std::string A = it1->second.point1();
    std::string B = it1->second.point2();
    std::string A1 = e.point().name();
    std::string B1 = AuxiliaryPoints::get();
    auxiliary_points.push_back(B1);
    std::string nl = e.newLine().name();
    lines.emplace(nl, Line{nl, A1, B1});
    return std::make_shared<OnParallel>(A, B, A1, B1);
  }
}

ExprPtr EliminateLinesTransformer::transformFunIntersectLL(const FunIntersectLL& e) {
  std::string pointId = e.newPoint().name();
  std::string lineId1  = e.line1().name();
  std::string lineId2  = e.line2().name();
  auto it1 = lines.find(lineId1);
  auto it2 = lines.find(lineId2);
  if (it1 == lines.end()) {
    throw std::string("Line ") + lineId1 + std::string("not found");
  } else if (it2 == lines.end()) {
    throw std::string("Line ") + lineId2 + std::string("not found");
  } else {
    // ExprPtr coll1 = make_expression("coll", it1->second.points[0], it1->second.points[1], pointId);
    // ExprPtr coll2 = make_expression("coll", it2->second.points[0], it2->second.points[1], pointId);
    // return make_expression("&", coll1, coll2);
    return std::make_shared<FunIntersectLL_P>(pointId, it1->second.point1(), it1->second.point2(), it2->second.point1(), it2->second.point2());
  }
}

ExprPtr EliminateLinesTransformer::transformFunIntersectLL_P(const FunIntersectLL_P& e) {
  return std::make_shared<FunIntersectLL_P>(e.newPoint().name(), e.A1().name(), e.B1().name(), e.A2().name(), e.B2().name());
}


ExprPtr EliminateLinesTransformer::transformOnParallel(const OnParallel& e) {
  return std::make_shared<OnParallel>(e.A().name(), e.B().name(), e.A1().name(), e.B1().name());
}
