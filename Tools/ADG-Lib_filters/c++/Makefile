# This Makefile is designed to be simple and readable.  It does not
# aim at portability.  It requires GNU Make.

BASE = main
BISON = bison
CXX = g++
FLEX = flex
XSLTPROC = xsltproc
CXXFLAGS = -std=c++17

all: $(BASE)

%.cc %.hh %.xml %.gv: %.yy
	$(BISON) $(BISONFLAGS) --xml --graph=$*.gv -o $*.cc $<

%.cc: %.ll
	$(FLEX) $(FLEXFLAGS) -o$@ $<

%.o: %.cc %.hh
	$(CXX) $(CXXFLAGS) -c -o$@ $<

$(BASE): $(BASE).o parser_gcl.o scanner_gcl.o driver_gcl.o parser_jgex.o scanner_jgex.o driver_jgex.o expression.o
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BASE).o: parser_gcl.hh parser_jgex.hh
parser_gcl.o: parser_gcl.hh
scanner_gcl.o: parser_gcl.hh
parser_jgex.o: parser_jgex.hh
scanner_jgex.o: parser_jgex.hh

run: $(BASE)
	./$< -

html: parser_gcl.html
%.html: %.xml
	$(XSLTPROC) $(XSLTPROCFLAGS) -o $@ $$($(BISON) --print-datadir)/xslt/xml2xhtml.xsl $<

CLEANFILES =										\
  $(BASE) *.o										\
  parser_gcl.hh parser_gcl.cc parser_gcl.output parser_gcl.xml parser_gcl.html parser_gcl.gv parser_gcl_location.hh	\
  scanner_gcl.cc \
  parser_jgex.hh parser_jgex.cc parser_jgex.output parser_jgex.xml parser_jgex.html parser_jgex.gv parser_jgex_location.hh	\
  scanner_jgex.cc
clean:
	rm -f $(CLEANFILES)
