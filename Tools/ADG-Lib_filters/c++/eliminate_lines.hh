#ifndef __ELIMINATE_LINES_HH__
#define __ELIMINATE_LINES_HH__

#include "expression.hh"
#include <map>

class EliminateLinesTransformer : public ExpressionTransformer {
public:
  ExprPtr transformConstant(const Constant&) override;
  ExprPtr transformVariable(const Variable&) override;
  ExprPtr transformNaryExpression(const NaryExpression& e) override;

  ExprPtr transformFreePoint(const FreePoint&) override;
  ExprPtr transformLine(const Line&) override;
  
  ExprPtr transformDrawPoint(const DrawPoint&) override;
  ExprPtr transformDrawSegment(const DrawSegment&) override;
  ExprPtr transformFunMidpoint(const FunMidpoint&) override;
  ExprPtr transformFunParallel(const FunParallel& e) override;
  ExprPtr transformFunIntersectLL(const FunIntersectLL& e) override;
  ExprPtr transformFunIntersectLL_P(const FunIntersectLL_P& e) override;

  ExprPtr transformOnParallel(const OnParallel& e) override;
  
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
