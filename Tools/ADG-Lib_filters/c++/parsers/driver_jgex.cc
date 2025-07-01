#include "driver_jgex.hh"

#include "driver_jgex.hh"
#include "parser_jgex.hh"

int driver_jgex::do_parse()
{
  location.initialize(&(this->file_name));
  parser_jgex::parser_jgex parse(*this);
  parse.set_debug_level(trace_parsing);
  return parse();
}

