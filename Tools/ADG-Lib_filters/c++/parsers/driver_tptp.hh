#include "driver.hh"
#include "parser_tptp.hh"

class driver_tptp : public driver
{
public:
  driver_tptp() {};
  
  // parsing function
  virtual int do_parse();

  // handling the scanner
  virtual void scan_begin();
  virtual void scan_end();
  // the token's location used by the scanner
  parser_tptp::location location;
};  

