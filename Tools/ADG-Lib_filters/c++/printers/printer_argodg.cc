#include "printer_argodg.hh"

void PrinterArgoDG::printHeader() {
  std::string header =   
    "<!DOCTYPE html>\n"
    "<html lang=\"en-US\">\n"
    "<head>\n"
    "  <meta charset=\"utf-8\">\n"
    "  <title>ArgoDG</title>\n"
    "  <script src=\"DG.js\"></script>\n"
    "  <script src=\"RC.js\"></script>\n"
    "</head>\n"
    "<body>\n"
    "  <div id=\"mycanvas\"></div>\n"
    "  <script>\n"
    "     DG.setup(\"mycanvas\", { width: 500, height: 500, border: \"1px solid #ccc\"}, 0, 100, 0, 100);";
  ostr_ << header << std::endl;
}

void PrinterArgoDG::printFooter() {
  std::string footer =
    "    </script>\n"
    "  </body>\n"
    "</html>\n";
  ostr_ << footer << std::endl;
}

void PrinterArgoDG::visitConstant(const Constant&) {
}

void PrinterArgoDG::visitVariable(const Variable& v) {
}

void PrinterArgoDG::visitNaryExpression(const NaryExpression& e) {
  if (e.op() == "&") {
    for (ExprPtr operand : e.operands())
      operand->acceptVisitor(*this);
  }
}

void PrinterArgoDG::visitFreePoint(const FreePoint& p) {
  ostr_ << p.id() << " = RC.point(" << p.x() << ", " << p.y() << ").color(\"blue\").hide();" << std::endl;
}

void PrinterArgoDG::visitLine(const Line& l) {
  ostr_ << l.id() << " = RC.line(" << l.point1() << ", " << l.point2() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitCircle(const Circle& c) {
  ostr_ << c.id() << " = RC.circle(" << c.center() << ", " << c.point_on_circle() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitDrawPoint(const DrawPoint& e) {
  ostr_ << e.A() << ".show();" << std::endl;
}

void PrinterArgoDG::visitLabelPoint(const LabelPoint& e) {
  ostr_ << e.A() << ".label(\"" << e.A().name() << "\");" << std::endl;
}

void PrinterArgoDG::visitDrawSegment(const DrawSegment& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "RC.segment(" << e.A() << ", " << e.B() << ");" << std::endl;
    break;
  case DASHED:
    ostr_ << "RC.segment(" << e.A() << ", " << e.B() << ").dashed();" << std::endl;
    break;
  }
}

void PrinterArgoDG::visitDrawLine(const DrawLine& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << e.l() << ".show();" << std::endl;
    break;
  case DASHED:
    ostr_ << e.l() << ".dashed().show();" << std::endl;
    break;
  }
}

void PrinterArgoDG::visitDrawLine_P(const DrawLine_P& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "RC.line(" << e.A() << ", " << e.B() << ");" << std::endl;
    break;
  case DASHED:
    ostr_ << "RC.line(" << e.A() << ", " << e.B() << ").dashed();" << std::endl;
    break;
  }
}


void PrinterArgoDG::visitDrawCircle(const DrawCircle& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << e.c() << ".show();" << std::endl;
    break;
  case DASHED:
    ostr_ << e.c() << ".dashed().show();" << std::endl;
    break;
  }
}

void PrinterArgoDG::visitDrawCircle_P(const DrawCircle_P& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "RC.line(" << e.O() << ", " << e.P() << ");" << std::endl;
    break;
  case DASHED:
    ostr_ << "RC.line(" << e.O() << ", " << e.P() << ").dashed();" << std::endl;
    break;
  }
}

void PrinterArgoDG::visitFunTowards(const FunTowards& e) {
  ostr_ << e.X() << " = RC.towards(" << e.A() << ", " << e.B() << " " << e.R() << std::endl;
}

void PrinterArgoDG::visitFunFoot(const FunFoot& e) {
  ostr_ << e.X() << " = RC.foot(" << e.P() << ", " << e.p() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitFunMidpoint(const FunMidpoint& e) {
  ostr_ << e.X() << " = RC.midpoint(" << e.A() << ", " << e.B() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitFunSegmentBisector(const FunSegmentBisector& e) {
  ostr_ << e.x() << " = RC.bisector(" << e.A() << ", " << e.B() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitFunParallel(const FunParallel& e) {
  ostr_ << e.x() << " = RC.parallel(" << e.l() << ", " << e.A() << ").hide();" << std::endl;  
}

void PrinterArgoDG::visitFunPerpendicular(const FunPerpendicular& e) {
  ostr_ << e.x() << " = RC.drop_perp(" << e.l() << " " << e.A() << ").hide();" << std::endl;  
}

void PrinterArgoDG::visitFunPerpendicular_P(const FunPerpendicular_P& e) {
  ostr_ << e.x() << " = RC.drop_perp(" << "RC.line(" << e.A() << ", " << e.B() << ").hide()" << ", " << e.P() << ").hide();" << std::endl;  
}

void PrinterArgoDG::visitFunTranslate(const FunTranslate& e) {
  // FIXME / CHECK ArgoDG syntax
  ostr_ << e.X() << " = RC.translate(" <<  e.X() << ", " << e.A() << ", " << e.B() << ", " << e.P() << ").hide();" << std::endl;
}


void PrinterArgoDG::visitFunIntersectLL(const FunIntersectLL& e) {
  ostr_ << e.X() << " = RC.intersectLL(" <<  e.l1() << ", " << e.l2() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitFunIntersectLL_P(const FunIntersectLL_P& e) {
  ostr_ << e.X() << " = RC.intersectLL("
        << "RC.line(" <<  e.A1() << ", " << e.B1() << ").hide()" << ", "
        << "RC.line(" <<  e.A2() << ", " << e.B2() << ").hide()" << ").hide();"
        << std::endl;
}

void PrinterArgoDG::visitFunIntersectLC(const FunIntersectLC& e) {
  ostr_ << e.X1() << " = RC.intersectLC1(" <<  e.l() << ", " << e.c() << ").hide();" << std::endl;
  ostr_ << e.X2() << " = RC.intersectLC2(" <<  e.l() << ", " << e.c() << ").hide();" << std::endl;  
}

void PrinterArgoDG::visitFunIntersectLC_P(const FunIntersectLC_P& e) {
  ostr_ << e.X1() << " = RC.intersectLC_P1("
        << "RC.line(" <<  e.A() << ", " << e.B() << ").hide()" << ", "
        << "RC.circle(" <<  e.O() << ", " << e.P() << ").hide()" << ").hide();"
        << std::endl;
  ostr_ << e.X2() << " = RC.intersectLC_P2("
        << "RC.line(" <<  e.A() << ", " << e.B() << ").hide()" << ", "
        << "RC.circle(" <<  e.O() << ", " << e.P() << ").hide()" << ").hide();"
        << std::endl;
}

void PrinterArgoDG::visitFunIntersectCC(const FunIntersectCC& e) {
  ostr_ << e.X1() << " = RC.intersectCC1(" <<  e.c1() << ", " << e.c2() << ").hide();" << std::endl;
  ostr_ << e.X2() << " = RC.intersectCC2(" <<  e.c1() << ", " << e.c2() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitFunIntersectCC_P(const FunIntersectCC_P& e) {
  ostr_ << e.X1() << " = RC.intersectCC("
        << "RC.circle(" <<  e.O1() << ", " << e.P1() << ").hide()" << ", "
        << "RC.circle(" <<  e.O2() << ", " << e.P2() << ").hide()" << ").hide();"
        << std::endl;
  ostr_ << e.X2() << " = RC.intersectCC("
        << "RC.circle(" <<  e.O1() << ", " << e.P1() << ").hide()" << ", "
        << "RC.circle(" <<  e.O2() << ", " << e.P2() << ").hide()" << ").hide();"
        << std::endl;
}


void PrinterArgoDG::visitOnLine_P(const OnLine_P& e) {
  ostr_ << e.X() << " = RC.free_point_on_line("
        << "RC.line(" <<  e.A() << ", " << e.B() << ").hide()" << ", "
        << "0, 0).color(\"red\").hide();"
        << std::endl;
}


void PrinterArgoDG::visitOnCircle_P(const OnCircle_P& e) {
  ostr_ << e.X() << " = RC.free_point_on_circle("
        << "0, 0).color(\"red\").hide();"
        << std::endl;
}


void PrinterArgoDG::visitOnParallel_P(const OnParallel_P& e) {
  ostr_ << e.X() << " = RC.free_point_on_parallel("
        << "RC.line(" <<  e.A() << ", " << e.B() << ").hide()" << ", "
        << e.P() << ", 0, 0).color(\"red\").hide();"
        << std::endl;
}

void PrinterArgoDG::visitOnPerpendicular_P(const OnPerpendicular_P& e) {
  ostr_ << e.X() << " = RC.free_point_on_perpendicular("
        << "RC.line(" <<  e.A() << ", " << e.B() << ").hide()" << ", "
        << e.P() << ", 0, 0).color(\"red\").hide();"
        << std::endl;
}

void PrinterArgoDG::visitTriangle(const Triangle& e) {
  visitFreePoint(e.A());
  visitFreePoint(e.B());
  visitFreePoint(e.C());
}
