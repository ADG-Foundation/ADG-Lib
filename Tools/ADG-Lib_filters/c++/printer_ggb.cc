#include "printer_ggb.hh"

void PrinterGGB::printHeader() {
  std::string header =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
    "<geogebra format=\"5.0\" xsi:noNamespaceSchemaLocation=\"http://www.geogebra.org/apps/xsd/ggb.xsd\""
    " xmlns=\"\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" >\n"
    "<construction>\n";
  ostr_ << header << std::endl;
}

void PrinterGGB::printFooter() {
  std::string footer =
    "</construction>\n"
    "</geogebra>\n";
  ostr_ << footer << std::endl;
}

void PrinterGGB::visitConstant(const Constant& c) {
  ostr_ << c.value();
}

void PrinterGGB::visitVariable(const Variable& v) {
  ostr_ << v.name();
}

void PrinterGGB::visitNaryExpression(const NaryExpression& e) {
  if (e.op() == "&") {
    for (ExprPtr operand : e.operands())
      operand->acceptVisitor(*this);
  } else {
    std::string op = e.op();
    if (e.operands().size() == 2) {
      ostr_ << "( ";
      e.operands()[0]->acceptVisitor(*this);
      ostr_ << ") " << op << " ";
      ostr_ << "( ";
      e.operands()[1]->acceptVisitor(*this);
      ostr_ << ")";
    } else if (op == "sratio") {
      ostr_ << "(Segment[";
      e.operands()[0]->acceptVisitor(*this);
      ostr_ << ", ";
      e.operands()[1]->acceptVisitor(*this);
      ostr_ << "]/Segment[";
      e.operands()[2]->acceptVisitor(*this);
      ostr_ << ", ";
      e.operands()[3]->acceptVisitor(*this);
      ostr_ << "])";
    } else if (op == "sa3") {
      ostr_ << "Area[";
      e.operands()[0]->acceptVisitor(*this);
      ostr_ << ", ";
      e.operands()[1]->acceptVisitor(*this);
      ostr_ << ", ";
      e.operands()[2]->acceptVisitor(*this);
      ostr_ << "]";
    } else if (op == "sa4") {
      ostr_ << "Area[";
      e.operands()[0]->acceptVisitor(*this);
      ostr_ << ", ";
      e.operands()[1]->acceptVisitor(*this);
      ostr_ << ", ";
      e.operands()[2]->acceptVisitor(*this);
      ostr_ << ", ";
      e.operands()[3]->acceptVisitor(*this);
      ostr_ << "]";
    } else {
      throw std::string("Unsupported operation: " + op);
    }
  }
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
  ostr_ << "<element type=\"point\" label=\"" << e.A() << "\">" << std::endl;
  ostr_ << "   <show object=\"true\" label=\"false\"/>" << std::endl;
  ostr_ << "</element>" << std::endl;
}

void PrinterGGB::visitLabelPoint(const LabelPoint& e) {
  ostr_ << "<element type=\"point\" label=\"" << e.A() << "\">" << std::endl;
  ostr_ << "   <show object=\"true\" label=\"true\"/>" << std::endl;
  ostr_ << "</element>" << std::endl;
}

void PrinterGGB::visitDrawSegment(const DrawSegment& e) {
  ostr_ << "<command name=\"Segment\">" << std::endl;
  ostr_ << "   <input a0=\"" << e.A() << "\" a1=\"" << e.B() << "\"/>" << std::endl;
  ostr_ << "   <output a0=\"" << "s" << e.A() << e.B() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;

  ostr_ << "<element type=\"segment\" label=\"" << "s" << e.A() << e.B() << "\">" << std::endl;
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
  ostr_ << "  <input a0=\"" << e.A() << "\" a1=\"" << e.B() << "\"/>" << std::endl;
  ostr_ << "  <output a0=\"" << e.X() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitFunSegmentBisector(const FunSegmentBisector& e) {
  ostr_ << "<command name=\"LineBisector\">" << std::endl;
  ostr_ << "  <input a0=\"" << e.A() << "\" a1=\"" << e.B() << "\"/>" << std::endl;
  ostr_ << "  <output a0=\"" << e.x() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitFunParallel(const FunParallel& e) {
  ostr_ << "<command name=\"Line\">" << std::endl;
  ostr_ << "  <input a0=\"" << e.A() << "\" a1=\"" << e.l() << "\"/>" << std::endl;
  ostr_ << "  <output a0=\"" << e.x() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitFunPerpendicular(const FunPerpendicular& e) {
  ostr_ << "<command name=\"OrthogonalLine\">" << std::endl;
  ostr_ << "  <input a0=\"" << e.A() << "\" a1=\"" << e.l() << "\"/>" << std::endl;
  ostr_ << "  <output a0=\"" << e.x() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitFunPerpendicular_P(const FunPerpendicular_P& e) {
  // FIXME
}

void PrinterGGB::visitFunIntersectLL(const FunIntersectLL& e) {
  ostr_ << "<command name=\"Intersect\">" << std::endl;
  ostr_ << "   <input a0=\"" << e.l1() << "\" a1=\"" << e.l2() << "\"/>" << std::endl;
  ostr_ << "   <output a0=\"" << e.X() << "\"/>" << std::endl;
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

void PrinterGGB::visitOnLine_P(const OnLine_P& e) {
  ostr_ << "<command name=\"Point\">" << std::endl;
  ostr_ << "   <input a0=\"Line[" << e.A() << ", " << e.B() << "]\"/>" << std::endl;
  ostr_ << "   <output a0=\"" << e.X() << "\"/>" << std::endl;
  ostr_ << "</command>" << std::endl;
}

void PrinterGGB::visitOnParallel_P(const OnParallel_P& e) {
  // FIXME
  ostr_ << "OnParallel " << std::endl;
}

void PrinterGGB::visitOnPerpendicular_P(const OnPerpendicular_P& e) {
  // FIXME
  ostr_ << "OnPerpendicular " << std::endl;
}

void PrinterGGB::visitCollinear(const Collinear& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    ostr_ << "<command name=\"Prove\">\n"
      "  <input a0=\"AreCollinear[" << e.A() << ", " << e.B() << ", " << e.C() << "]\"/>\n" <<
      "  <output a0=\"" << AuxiliaryObjects::get() << "\"/>\n" <<
      "</command>\n";
}

void PrinterGGB::visitEqual(const Equal& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else {
      if (ggb_functional_request) {
        // Functional form (it is required currently if the arguments are Area[...], FIXME):
        ostr_ << "<command name=\"Prove\">\n"
          "  <input a0=\"AreEqual[";
        e.operands()[0]->acceptVisitor(*this);
        ostr_ << ", ";
        e.operands()[1]->acceptVisitor(*this);
        ostr_ << "]\"/>\n" <<
          "  <output a0=\"" << AuxiliaryObjects::get() << "\"/>\n" <<
          "</command>\n";
      } else {
        // Relational form:
        ostr_ << "<command name=\"Prove\">\n"
          "  <input a0=\"";
        e.operands()[0]->acceptVisitor(*this);
        ostr_ << " == ";
        e.operands()[1]->acceptVisitor(*this);
        ostr_ << "\"/>\n" <<
          "  <output a0=\"" << AuxiliaryObjects::get() << "\"/>\n" <<
          "</command>\n";
      }
  }
}

void PrinterGGB::visitParallel_P(const Parallel_P& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    ostr_ << "<command name=\"Prove\">\n"
      "  <input a0=\"AreParallel[Line[" << e.A1() << ", " << e.B1()
      << "], Line[" << e.A2() << ", " << e.B2() << "]]\"/>\n" <<
      "  <output a0=\"" << AuxiliaryObjects::get() << "\"/>\n" <<
      "</command>\n";
}


void PrinterGGB::visitPerpendicular_P(const Perpendicular_P& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    ostr_ << "<command name=\"Prove\">\n"
      "  <input a0=\"ArePerpendicular[Line[" << e.A1() << ", " << e.B1()
      << "], Line[" << e.A2() << ", " << e.B2() << "]]\"/>\n" <<
      "  <output a0=\"" << AuxiliaryObjects::get() << "\"/>\n" <<
      "</command>\n";
}

void PrinterGGB::visitIdentical(const Identical& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else {
    ostr_ << "prove { " << "identical ";
    e.A().acceptVisitor(*this);
    ostr_ << " ";
    e.B().acceptVisitor(*this);
    ostr_ << " } ";

    ostr_ << "<command name=\"Prove\">\n"
      "  <input a0=\"AreEqual[";
    e.A().acceptVisitor(*this);
    ostr_ << ", ";
    e.B().acceptVisitor(*this);
    ostr_ << "]\"/>\n" <<
      "  <output a0=\"" << AuxiliaryObjects::get() << "\"/>\n" <<
      "</command>\n";
  }
}

void PrinterGGB::visitHarmonic(const Harmonic& e) {
  if (!printingConjectures_)
    throw std::string("Predicates in hypotheses are not supported");
  else
    ostr_ << "<command name=\"Prove\">\n"
      "  <input a0=\"Segment[";
    e.A().acceptVisitor(*this);
    ostr_ << ", ";
    e.C().acceptVisitor(*this);
    ostr_ << "]*Segment[";
    e.D().acceptVisitor(*this);
    ostr_ << ", ";
    e.B().acceptVisitor(*this);
    ostr_ << "] == Segment[";
    e.C().acceptVisitor(*this);
    ostr_ << ", ";
    e.B().acceptVisitor(*this);
    ostr_ << "]*Segment[";
    e.D().acceptVisitor(*this);
    ostr_ << ", ";
    e.A().acceptVisitor(*this);
    ostr_ << "]\"/>\n" <<
      "  <output a0=\"" << AuxiliaryObjects::get() << "\"/>\n" <<
      "</command>\n";
}
