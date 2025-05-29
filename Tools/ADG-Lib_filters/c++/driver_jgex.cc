#include "driver_jgex.hh"

#include "driver_jgex.hh"
#include "parser_jgex.hh"

driver_jgex::driver_jgex()
  : trace_parsing(false), trace_scanning(false)
{
}

int driver_jgex::parse(const std::string& file_name)
{
  this->file_name = file_name;
  location.initialize(&(this->file_name));
  scan_begin();
  parser_jgex::parser_jgex parse(*this);
  parse.set_debug_level(trace_parsing);
  int result = parse();
  scan_end();
  return result;
}

