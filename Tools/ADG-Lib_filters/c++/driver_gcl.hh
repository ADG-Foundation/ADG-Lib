#ifndef __DRIVER_GCL_HH__
#define __DRIVER_GCL_HH__

#include "driver.hh"
#include "parser_gcl.hh"

class driver_gcl : public driver
{
public:
  driver_gcl() {};
  
  // parsing function
  virtual int do_parse();

  // handling the scanner
  virtual void scan_begin();
  virtual void scan_end();
  // the token's location used by the scanner
  parser_gcl::location location;
};  


#endif
