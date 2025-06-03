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

ExprPtr EliminateLinesTransformer::transformLabelPoint(const LabelPoint& e) {
  return std::make_shared<LabelPoint>(e.point().name());
}

ExprPtr EliminateLinesTransformer::transformDrawSegment(const DrawSegment& e) {
  return std::make_shared<DrawSegment>(e.point1().name(), e.point2().name());
}

ExprPtr EliminateLinesTransformer::transformDrawLine(const DrawLine& e) {
  std::string lineId  = e.line().name();
  auto it1 = lines.find(lineId);
  if (it1 == lines.end())
    throw std::string("Line ") + lineId + std::string(" not found");
  else {
    std::string A = it1->second.point1();
    std::string B = it1->second.point2();
    return std::make_shared<DrawLine_P>(A, B, e.style());
  }
}

ExprPtr EliminateLinesTransformer::transformDrawLine_P(const DrawLine_P& e) {
  return std::make_shared<DrawLine_P>(e.point1().name(), e.point2().name(), e.style());
}


ExprPtr EliminateLinesTransformer::transformFunMidpoint(const FunMidpoint& e) {
  return std::make_shared<FunMidpoint>(e.newPoint().name(), e.point1().name(), e.point2().name());
}

ExprPtr EliminateLinesTransformer::transformFunSegmentBisector(const FunSegmentBisector& e) {
  std::string A = e.point1().name();
  std::string B = e.point1().name();
  
  std::string M = AuxiliaryPoints::get();
  ExprPtr m = std::make_shared<FunMidpoint>(M, A, B);
  std::string l = AuxiliaryLines::get();
  std::string p = AuxiliaryLines::get();
  return std::make_shared<FunPerpendicular>(p, M, l)->acceptTransformer(*this);
}

ExprPtr EliminateLinesTransformer::transformFunParallel(const FunParallel& e) {
  std::string lineId  = e.line().name();
  auto it1 = lines.find(lineId);
  if (it1 == lines.end())
    throw std::string("Line ") + lineId + std::string(" not found");
  else {
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

ExprPtr EliminateLinesTransformer::transformFunPerpendicular(const FunPerpendicular& e) {
  std::string l = e.line().name();
  auto it = lines.find(l);
  if (it == lines.end()) {
    throw std::string("Line ") + l + std::string(" not found");
  } else {
    std::string A = it->second.point1();
    std::string B = it->second.point2();
    std::string X = AuxiliaryPoints::get();
    auxiliary_points.push_back(X);
    std::string M = e.point().name();
    std::string p = e.newLine().name();
    lines.emplace(p, Line{p, M, X});
    return std::make_shared<OnPerpendicular>(X, A, B, M);
  }
}


ExprPtr EliminateLinesTransformer::transformFunIntersectLL(const FunIntersectLL& e) {
  std::string pointId = e.newPoint().name();
  std::string lineId1  = e.line1().name();
  std::string lineId2  = e.line2().name();
  auto it1 = lines.find(lineId1);
  auto it2 = lines.find(lineId2);
  if (it1 == lines.end()) {
    throw std::string("Line ") + lineId1 + std::string(" not found");
  } else if (it2 == lines.end()) {
    throw std::string("Line ") + lineId2 + std::string(" not found");
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

ExprPtr EliminateLinesTransformer::transformOnPerpendicular(const OnPerpendicular& e) {
  return std::make_shared<OnPerpendicular>(e.X().name(), e.A().name(), e.B().name(), e.P().name());
}


ExprPtr EliminateLinesTransformer::transformMidpoint(const Midpoint& e) {
  return std::make_shared<Midpoint>(e.midpoint().name(), e.point1().name(), e.point2().name());
}
