#include "expression.hh"

// Algebraic and area-method provers (used in Geogebra and GCLC) use
// the notion of paralleldg(A, B, C, D) that is true if A=B or C=D
// (degerated cases of parallel are allowed). This transformer
// rewrites such predicates by its NDG variant + corresponding
// conditions added to hypotheses


class EliminateDGTransformer : public ExpressionTransformer {
public:
  EliminateDGTransformer(std::vector<ExprPtr>& hypotheses) : hypotheses_(hypotheses) {
  }

  virtual ExprPtr transformParallelDG_P(const ParallelDG_P& e) override; 
  virtual ExprPtr transformPerpendicularDG_P(const PerpendicularDG_P& e) override; 

private:
  std::vector<ExprPtr>& hypotheses_;
};
