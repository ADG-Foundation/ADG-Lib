#ifndef __ELIMINATE_LINES_HH__
#define __ELIMINATE_LINES_HH__

#include "expression.hh"

class EliminateLinesTransformer : public ExpressionTransformer {
public:
  ExprPtr transformConstant(const Constant& c) {
    return std::make_shared<Constant>(c.value());
  }
  
  virtual ExprPtr transformVariable(const Variable& v) {
    return std::make_shared<Variable>(v.name());
  }
  
  virtual ExprPtr transformNaryExpression(const NaryExpression& e) {
    std::vector<ExprPtr> operands;
    for (ExprPtr op : e.operands())
      operands.push_back(op->acceptTransformer(*this));
    return std::make_shared<NaryExpression>(e.op(), operands);
  }

  ExprPtr transformFunParallel(const FunParallel& e) {
    std::string newLineId = e.newLine().name();
    std::string pointId  = e.point().name();
    std::string parallelLineId  = e.line().name();
    auto it = lines.find(parallelLineId);
    if (it == lines.end()) {
      throw std::string("Unknown parallel line: ") + parallelLineId;
    } else {
      std::string aux_point = AuxiliaryPoints::get();
      auxiliary_points.push_back(aux_point);
      lines.emplace(newLineId, Line{newLineId, pointId, aux_point});
      return make_expression("para", it->second.points[0], it->second.points[1], pointId, aux_point);
    }
    
  }

  ExprPtr transformIntersectLL(const FunIntersectLL& e) {
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
      ExprPtr coll1 = make_expression("coll", it1->second.points[0], it1->second.points[1], pointId);
      ExprPtr coll2 = make_expression("coll", it2->second.points[0], it2->second.points[1], pointId);
      return make_expression("&", coll1, coll2);
    }
  }
  
  void addLines(const std::map<std::string, Line> newLines) {
    lines.insert(newLines.begin(), newLines.end());
  }

  const std::vector<std::string>& auxiliaryPoints() {
    return auxiliary_points;
  }
  
private:
  std::map<std::string, Line> lines;
  std::vector<std::string> auxiliary_points;
};

#endif
