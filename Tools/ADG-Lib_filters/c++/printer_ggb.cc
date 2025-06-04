#include "printer_ggb.hh"

void PrinterGGB::visitConstant(const Constant&) {
}

void PrinterGGB::visitVariable(const Variable& v) {
}

void PrinterGGB::visitNaryExpression(const NaryExpression& e) {
}

void PrinterGGB::visitFreePoint(const FreePoint& p) {
  ostr_ << "<expression label=\"" << p.id() << "\" exp=\"(" << p.x() / 10.0 << "," << p.y() / 10.0 << ")\" type=\"point\"/>" << std::endl;
}

void PrinterGGB::visitLine(const Line& e) {
  ostr_ << "<command name=\"Line\">" << std::endl;
  ostr_ << "  <input a0=\"" << e.point1() << "\" a1=\"" << e.point2() << "\"/>" << std::endl;
  ostr_ << "  <output a0=\"" << e.id() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}


void PrinterGGB::visitDrawPoint(const DrawPoint& e) {
  ostr_ << "<element type=\"point\" label=\"" << e.point() << "\">" << std::endl;
  ostr_ << "   <show object=\"true\" label=\"false\"/>" << std::endl;
  ostr_ << "</element>" << std::endl;
}

void PrinterGGB::visitLabelPoint(const LabelPoint& e) {
  ostr_ << "<element type=\"point\" label=\"" << e.point() << "\">" << std::endl;
  ostr_ << "   <show object=\"true\" label=\"true\"/>" << std::endl;
  ostr_ << "</element>" << std::endl;
}

void PrinterGGB::visitDrawSegment(const DrawSegment& e) {
  ostr_ << "<command name=\"Segment\">" << std::endl;
  ostr_ << "   <input a0=\"" << e.point1() << "\" a1=\"" << e.point2() << "\"/>" << std::endl;
  ostr_ << "   <output a0=\"" << "s" << e.point1() << e.point2() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;

  ostr_ << "<element type=\"segment\" label=\"" << "s" << e.point1() << e.point2() << "\">" << std::endl;
  ostr_ << "   <show object=\"true\" label=\"false\"/>" << std::endl;
  switch (e.style()) {
  case SOLID:
    break;
  case DASHED:
    ostr_ << "   <lineStyle type=\"15\"/>" << std::endl;
    break;
  case BOLD:
    ostr_ << "   <lineStyle type=\"30\"/>" << std::endl;
    break;
  }
  ostr_ << "</element>" << std::endl;
}

void PrinterGGB::visitDrawLine(const DrawLine& e) {
  // FIXME
}

void PrinterGGB::visitDrawLine_P(const DrawLine_P& e) {
  // FIXME
}


void PrinterGGB::visitFunMidpoint(const FunMidpoint& e) {
  ostr_ << "<command name=\"Midpoint\">" << std::endl;
  ostr_ << "  <input a0=\"" << e.point1() << "\" a1=\"" << e.point2() << "\"/>" << std::endl;
  ostr_ << "  <output a0=\"" << e.newPoint() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitFunSegmentBisector(const FunSegmentBisector& e) {
  ostr_ << "<command name=\"LineBisector\">" << std::endl;
  ostr_ << "  <input a0=\"" << e.point1() << "\" a1=\"" << e.point2() << "\"/>" << std::endl;
  ostr_ << "  <output a0=\"" << e.newLine() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitFunParallel(const FunParallel& e) {
  ostr_ << "<command name=\"Line\">" << std::endl;
  ostr_ << "  <input a0=\"" << e.point() << "\" a1=\"" << e.line() << "\"/>" << std::endl;
  ostr_ << "  <output a0=\"" << e.newLine() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitFunPerpendicular(const FunPerpendicular& e) {
  ostr_ << "<command name=\"OthogonalLine\">" << std::endl;
  ostr_ << "  <input a0=\"" << e.point() << "\" a1=\"" << e.line() << "\"/>" << std::endl;
  ostr_ << "  <output a0=\"" << e.newLine() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitFunIntersectLL(const FunIntersectLL& e) {
  ostr_ << "<command name=\"Intersect\">" << std::endl;
  ostr_ << "   <input a0=\"" << e.line1() << "\" a1=\"" << e.line2() << "\"/>" << std::endl;
  ostr_ << "   <output a0=\"" << e.newPoint() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitFunIntersectLL_P(const FunIntersectLL_P& e) {
  // FIXME
  /*
  ostr_ << "<command name=\"Intersect\">" << std::endl;
  ostr_ << "   <input a0=\"" << e.line1() << "\" a1=\"" << e.line2() << "\"/>" << std::endl;
  ostr_ << "   <output a0=\"" << e.newPoint() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
  */
}

void PrinterGGB::visitOnLine(const OnLine& e) {
  // FIXME
  ostr_ << "OnLine " << std::endl;
}

void PrinterGGB::visitOnParallel(const OnParallel& e) {
  // FIXME
  ostr_ << "OnParallel " << std::endl;
}

void PrinterGGB::visitOnPerpendicular(const OnPerpendicular& e) {
  // FIXME
  ostr_ << "OnPerpendicular " << std::endl;
}
