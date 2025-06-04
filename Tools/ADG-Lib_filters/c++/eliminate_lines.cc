#include "eliminate_lines.hh"


ExprPtr EliminateLinesTransformer::transformNaryExpression(const NaryExpression& e) {
  std::vector<ExprPtr> operands;
  for (ExprPtr op : e.operands())
    operands.push_back(op->acceptTransformer(*this));
  return std::make_shared<NaryExpression>(e.op(), operands);
}

ExprPtr EliminateLinesTransformer::transformDrawLine(const DrawLine& e) {
  std::string lineId  = e.line().name();
  auto it1 = lines_.find(lineId);
  if (it1 == lines_.end())
    throw std::string("Line ") + lineId + std::string(" not found");
  else {
    std::string A = it1->second.point1();
    std::string B = it1->second.point2();
    return std::make_shared<DrawLine_P>(A, B, e.style());
  }
}

ExprPtr EliminateLinesTransformer::transformFunSegmentBisector(const FunSegmentBisector& e) {
  std::string A = e.point1().name();
  std::string B = e.point2().name();
  
  std::string M = AuxiliaryPoints::get();
  points_.push_back(M);
  ExprPtr midpoint = std::make_shared<FunMidpoint>(M, A, B);
  std::string l = AuxiliaryLines::get();
  lines_.emplace(l, Line{l, A, B});
  ExprPtr perp = std::make_shared<FunPerpendicular>(e.newLine().name(), M, l)->acceptTransformer(*this);
  return make_expression("&", midpoint, perp);
}

ExprPtr EliminateLinesTransformer::transformFunParallel(const FunParallel& e) {
  std::string lineId  = e.line().name();
  auto it1 = lines_.find(lineId);
  if (it1 == lines_.end())
    throw std::string("Line ") + lineId + std::string(" not found");
  else {
    std::string A = it1->second.point1();
    std::string B = it1->second.point2();
    std::string P = e.point().name();
    std::string X = AuxiliaryPoints::get();
    points_.push_back(X);
    std::string nl = e.newLine().name();
    lines_.emplace(nl, Line{nl, P, X});
    return std::make_shared<OnParallel>(X, A, B, P);
  }
}

ExprPtr EliminateLinesTransformer::transformFunPerpendicular(const FunPerpendicular& e) {
  std::string l = e.line().name();
  auto it = lines_.find(l);
  if (it == lines_.end()) {
    throw std::string("Line ") + l + std::string(" not found");
  } else {
    std::string A = it->second.point1();
    std::string B = it->second.point2();
    std::string X = AuxiliaryPoints::get();
    points_.push_back(X);
    std::string M = e.point().name();
    std::string p = e.newLine().name();
    lines_.emplace(p, Line{p, M, X});
    return std::make_shared<OnPerpendicular>(X, A, B, M);
  }
}


ExprPtr EliminateLinesTransformer::transformFunIntersectLL(const FunIntersectLL& e) {
  std::string pointId = e.newPoint().name();
  std::string lineId1  = e.line1().name();
  std::string lineId2  = e.line2().name();
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
