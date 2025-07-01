#include "eliminate_dg.hh"

ExprPtr EliminateDGTransformer::transformParallelDG_P(const ParallelDG_P& e) {
  // FIXME: push_front
  ExprPtr neq1 = make_expression("!=", e.A1().name(), e.B1().name()); 
  ExprPtr neq2 = make_expression("!=", e.A2().name(), e.B2().name()); 
  hypotheses_.push_back(make_expression("&", neq1, neq2));
  return std::make_shared<Parallel_P>(e.A1().name(), e.B1().name(), e.A2().name(), e.B2().name());
}

ExprPtr EliminateDGTransformer::transformPerpendicularDG_P(const PerpendicularDG_P& e) {
  // FIXME: push_front
  ExprPtr neq1 = make_expression("!=", e.A1().name(), e.B1().name()); 
  ExprPtr neq2 = make_expression("!=", e.A2().name(), e.B2().name()); 
  hypotheses_.push_back(make_expression("&", neq1, neq2));
  return std::make_shared<Perpendicular_P>(e.A1().name(), e.B1().name(), e.A2().name(), e.B2().name());
}
