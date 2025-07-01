#ifndef __DRIVER_JGEX_HH__
#define __DRIVER_JGEX_HH__

#include "driver.hh"
#include "parser_jgex.hh"

class driver_jgex : public driver
{
public:
  driver_jgex() {}

  int do_parse();

   // mode that switches from hypotheses to conjectures
  bool show = false;
  
  // handling the scanner.
  void scan_begin();
  void scan_end();
  // the token's location used by the scanner
  parser_jgex::location location;
};  


#endif
