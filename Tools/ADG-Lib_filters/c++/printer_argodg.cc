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

void PrinterArgoDG::visitDrawPoint(const DrawPoint& e) {
  ostr_ << e.point() << ".show();" << std::endl;
}

void PrinterArgoDG::visitLabelPoint(const LabelPoint& e) {
  ostr_ << e.point() << ".label(\"" << e.point().name() << "\");" << std::endl;
}

void PrinterArgoDG::visitDrawSegment(const DrawSegment& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "RC.segment(" << e.point1() << ", " << e.point2() << ");" << std::endl;
    break;
  case DASHED:
    ostr_ << "RC.segment(" << e.point1() << ", " << e.point2() << ").dashed();" << std::endl;
    break;
  }
}

void PrinterArgoDG::visitDrawLine(const DrawLine& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << e.line() << ".show();" << std::endl;
    break;
  case DASHED:
    ostr_ << e.line() << ".dashed().show();" << std::endl;
    break;
  }
}

void PrinterArgoDG::visitDrawLine_P(const DrawLine_P& e) {
  switch(e.style()) {
  case SOLID:
  case BOLD:
    ostr_ << "RC.line(" << e.point1() << ", " << e.point2() << ");" << std::endl;
    break;
  case DASHED:
    ostr_ << "RC.line(" << e.point1() << ", " << e.point2() << ").dashed();" << std::endl;
    break;
  }
}


void PrinterArgoDG::visitFunMidpoint(const FunMidpoint& e) {
  ostr_ << e.newPoint() << " = RC.midpoint(" << e.point1() << ", " << e.point2() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitFunSegmentBisector(const FunSegmentBisector& e) {
  ostr_ << e.newLine() << " = RC.bisector(" << e.point1() << ", " << e.point2() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitFunParallel(const FunParallel& e) {
  ostr_ << e.newLine() << " = RC.parallel(" << e.line() << ", " << e.point() << ").hide();" << std::endl;  
}

void PrinterArgoDG::visitFunPerpendicular(const FunPerpendicular& e) {
  ostr_ << e.newLine() << " = RC.drop_perp(" << e.line() << " " << e.point() << ").hide();" << std::endl;  
}

void PrinterArgoDG::visitFunIntersectLL(const FunIntersectLL& e) {
  ostr_ << e.newPoint() << " = RC.intersectLL(" <<  e.line1() << ", " << e.line2() << ").hide();" << std::endl;
}

void PrinterArgoDG::visitFunIntersectLL_P(const FunIntersectLL_P& e) {
  ostr_ << e.newPoint() << " = RC.intersectLL("
        << "RC.line(" <<  e.A1() << ", " << e.B1() << ").hide()" << ", "
        << "RC.line(" <<  e.A2() << ", " << e.B2() << ").hide()" << ").hide();"
        << std::endl;
}

void PrinterArgoDG::visitOnLine(const OnLine& e) {
  ostr_ << e.X() << " = RC.free_point_on_line("
        << "RC.line(" <<  e.A() << ", " << e.B() << ").hide()" << ", "
        << "0, 0).color(\"red\").hide();"
        << std::endl;
}

void PrinterArgoDG::visitOnParallel(const OnParallel& e) {
  ostr_ << e.X() << " = RC.free_point_on_parallel("
        << "RC.line(" <<  e.A() << ", " << e.B() << ").hide()" << ", "
        << e.P() << ", 0, 0).color(\"red\").hide();"
        << std::endl;
}

void PrinterArgoDG::visitOnPerpendicular(const OnPerpendicular& e) {
  ostr_ << e.X() << " = RC.free_point_on_perpendicular("
        << "RC.line(" <<  e.A() << ", " << e.B() << ").hide()" << ", "
        << e.P() << ", 0, 0).color(\"red\").hide();"
        << std::endl;
}
