#include "driver_gcl.hh"
#include "parser_gcl.hh"

driver_gcl::driver_gcl()
  : trace_parsing(false), trace_scanning(false)
{
}

int driver_gcl::parse(const std::string& file_name)
{
  this->file_name = file_name;
  location.initialize(&(this->file_name));
  scan_begin();
  parser_gcl::parser_gcl parse(*this);
  parse.set_debug_level(trace_parsing);
  int result = parse();
  scan_end();
  return result;
}
