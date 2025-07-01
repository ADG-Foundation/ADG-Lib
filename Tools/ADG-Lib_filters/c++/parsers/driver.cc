#include "driver.hh"

driver::driver()
  : trace_parsing(false), trace_scanning(false)
{
}

int driver::parse(const std::string& file_name)
{
  this->file_name = file_name;
  scan_begin();
  int result = do_parse();
  scan_end();
  return result;
}
