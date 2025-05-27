#include "driver.hh"
#include "parser_gcl.hh"

driver::driver()
  : trace_parsing(false), trace_scanning(false)
{
}

int driver::parse(const std::string& file_name)
{
  this->file_name = file_name;
  location.initialize(&(this->file_name));
  scan_begin();
  yy::parser parse(*this);
  parse.set_debug_level(trace_parsing);
  int result = parse();
  scan_end();
  return result;
}
