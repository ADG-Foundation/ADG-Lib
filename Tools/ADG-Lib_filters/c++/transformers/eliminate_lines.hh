#ifndef __ELIMINATE_LINES_HH__
#define __ELIMINATE_LINES_HH__

#include "expression.hh"
#include <map>


// Transformer that eliminates lines, circles etc. and returns an
// expression that includes only points

class EliminateLinesTransformer : public ExpressionTransformer {
public:

  EliminateLinesTransformer(std::vector<Point>& points,
                            std::map<std::string, Line>& lines)
    : points_(points), lines_(lines) {
  }

  ExprPtr transformNaryExpression(const NaryExpression& e) override;

  ExprPtr transformFoot(const Foot&) override;  
  ExprPtr transformDrawLine(const DrawLine&) override;
  ExprPtr transformDrawCircle(const DrawCircle&) override;  
  ExprPtr transformFunSegmentBisector(const FunSegmentBisector&) override;
  ExprPtr transformFunParallel(const FunParallel& e) override;
  ExprPtr transformFunPerpendicular(const FunPerpendicular& e) override;
  ExprPtr transformFunIntersectLL(const FunIntersectLL& e) override;
  ExprPtr transformFunIntersectLC(const FunIntersectLC& e) override;
  ExprPtr transformFunIntersectCC(const FunIntersectCC& e) override;


  ExprPtr transformCircle(const Circle& e) override;
  
private:
  std::map<std::string, Line> lines_;
  std::map<std::string, Circle> circles_;  
  std::vector<Point>& points_;
};

#endif
