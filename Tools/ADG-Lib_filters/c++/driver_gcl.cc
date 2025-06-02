#include "driver_gcl.hh"
#include "parser_gcl.hh"

int driver_gcl::do_parse()
{
  location.initialize(&(this->file_name));
  parser_gcl::parser_gcl parse(*this);
  parse.set_debug_level(trace_parsing);
  return parse();
}
