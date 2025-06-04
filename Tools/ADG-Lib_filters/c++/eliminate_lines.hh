#ifndef __ELIMINATE_LINES_HH__
#define __ELIMINATE_LINES_HH__

#include "expression.hh"
#include <map>

class EliminateLinesTransformer : public ExpressionTransformer {
public:

  EliminateLinesTransformer(std::vector<Point>& points,
                            std::map<std::string, Line>& lines)
    : points_(points), lines_(lines) {
  }
  
  ExprPtr transformNaryExpression(const NaryExpression& e) override;
  ExprPtr transformDrawLine(const DrawLine&) override;
  ExprPtr transformFunSegmentBisector(const FunSegmentBisector&) override;
  ExprPtr transformFunParallel(const FunParallel& e) override;
  ExprPtr transformFunPerpendicular(const FunPerpendicular& e) override;
  ExprPtr transformFunIntersectLL(const FunIntersectLL& e) override;
  
private:
  std::map<std::string, Line> lines_;
  std::vector<Point>& points_;
};

#endif
