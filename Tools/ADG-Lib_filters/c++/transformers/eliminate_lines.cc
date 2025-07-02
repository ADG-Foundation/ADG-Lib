#include "eliminate_lines.hh"


ExprPtr EliminateLinesTransformer::transformNaryExpression(const NaryExpression& e) {
  std::vector<ExprPtr> operands;
  for (ExprPtr op : e.operands())
    operands.push_back(op->acceptTransformer(*this));
  return std::make_shared<NaryExpression>(e.op(), operands);
}


ExprPtr EliminateLinesTransformer::transformFoot(const Foot& e) {
  std::string lineId  = e.p().name();
  auto it1 = lines_.find(lineId);
  if (it1 == lines_.end())
    throw std::string("Line ") + lineId + std::string(" not found");
  else {
    std::string A = it1->second.point1();
    std::string B = it1->second.point2();
    return std::make_shared<Foot_P>(e.X().name(), e.P().name(), A, B);
  }
}


ExprPtr EliminateLinesTransformer::transformDrawLine(const DrawLine& e) {
  std::string lineId  = e.l().name();
  auto it1 = lines_.find(lineId);
  if (it1 == lines_.end())
    throw std::string("Line ") + lineId + std::string(" not found");
  else {
    std::string A = it1->second.point1();
    std::string B = it1->second.point2();
    return std::make_shared<DrawLine_P>(A, B, e.style());
  }
}

ExprPtr EliminateLinesTransformer::transformDrawCircle(const DrawCircle& e) {
  std::string circleId  = e.c().name();
  auto it1 = circles_.find(circleId);
  if (it1 == circles_.end())
    throw std::string("Circle ") + circleId + std::string(" not found");
  else {
    std::string O = it1->second.center();
    std::string P = it1->second.point_on_circle();
    return std::make_shared<DrawCircle_P>(O, P, e.style());
  }
}


ExprPtr EliminateLinesTransformer::transformFunSegmentBisector(const FunSegmentBisector& e) {
  std::string A = e.A().name();
  std::string B = e.B().name();
  
  std::string M = AuxiliaryPoints::get();
  points_.push_back(M);
  ExprPtr midpoint = std::make_shared<FunMidpoint>(M, A, B);
  std::string p = AuxiliaryLines::get();
  lines_.emplace(p, Line{p, A, B});
  ExprPtr perp = std::make_shared<FunPerpendicular>(e.x().name(), M, p)->acceptTransformer(*this);
  return make_expression("&", midpoint, perp);
}

ExprPtr EliminateLinesTransformer::transformFunParallel(const FunParallel& e) {
  std::string lineId  = e.l().name();
  auto it1 = lines_.find(lineId);
  if (it1 == lines_.end())
    throw std::string("Line ") + lineId + std::string(" not found");
  else {
    std::string A = it1->second.point1();
    std::string B = it1->second.point2();
    std::string P = e.A().name();
    std::string X = AuxiliaryPoints::get();
    points_.push_back(X);
    std::string x = e.x().name();
    lines_.emplace(x, Line{x, P, X});
    return std::make_shared<OnParallel_P>(X, A, B, P);
  }
}

ExprPtr EliminateLinesTransformer::transformFunPerpendicular(const FunPerpendicular& e) {
  std::string l = e.l().name();
  auto it = lines_.find(l);
  if (it == lines_.end()) {
    throw std::string("Line ") + l + std::string(" not found");
  } else {
    std::string A = it->second.point1();
    std::string B = it->second.point2();
    std::string X = AuxiliaryPoints::get();
    points_.push_back(X);
    std::string M = e.A().name();
    std::string p = e.x().name();
    lines_.emplace(p, Line{p, M, X});
    return std::make_shared<OnPerpendicular_P>(X, A, B, M);
  }
}


ExprPtr EliminateLinesTransformer::transformFunIntersectLL(const FunIntersectLL& e) {
  std::string pointId = e.X().name();
  std::string lineId1  = e.l1().name();
  std::string lineId2  = e.l2().name();
  auto it1 = lines_.find(lineId1);
  auto it2 = lines_.find(lineId2);
  if (it1 == lines_.end()) {
    throw std::string("Line ") + lineId1 + std::string(" not found");
  } else if (it2 == lines_.end()) {
    throw std::string("Line ") + lineId2 + std::string(" not found");
  } else {
    return std::make_shared<FunIntersectLL_P>(pointId, it1->second.point1(), it1->second.point2(), it2->second.point1(), it2->second.point2());
  }
}

ExprPtr EliminateLinesTransformer::transformCircle(const Circle& e) {
  std::string c = e.id();
  std::string O = e.center();
  std::string P = e.point_on_circle();
  circles_.emplace(c, Circle{c, O, P});
  return nullptr;
}


