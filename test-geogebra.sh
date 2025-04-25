#!/bin/bash

# This script tests all *.p files in GeoGebra, after converting them into .ggb files.
# To avoid annoying error messages in popup windows, run this script like this:
# xvfb-run -a -s "-screen 0 1024x768x24" ./test-geogebra.sh

trap "echo 'Exit forced'" EXIT
trap "echo 'Term forced'" TERM
trap "echo 'Kill forced'" KILL

GEOGEBRA=`which geogebra-discovery`
TIMEOUT=10
OUT_DIR=`pwd`/Generated

# Build ADGLibToolkit:
cd Tools/ADG-Lib_tools
TOOLKIT_DIR=`pwd`
make -s

cd ../../TPTP/PointsOnly/GCLCcollection
P_DIR=`pwd`
SUCCESS=0
ALL=0
for i in *.p; do
  cd "$OUT_DIR"
  TESTNAME=`basename $i .p`
  echo -n "$TESTNAME..."
  # Convert the .p file to geogebra.xml:
  "$TOOLKIT_DIR/ADGLibToolkit" "$P_DIR/$i" geogebra.xml -geogebra \
    > "$TESTNAME.adgtoolkit.out" 2> "$TESTNAME.adgtoolkit.err"
  # Create GeoGebra file:
  zip -q "$TESTNAME.ggb" "geogebra.xml"
  # Run GeoGebra:
  timeout $TIMEOUT $GEOGEBRA --prover=timeout:$TIMEOUT --logFile="$TESTNAME.log" \
    --regressionFile="$TESTNAME.result" --language=en "$TESTNAME.ggb" \
    > "$TESTNAME.out" 2> "$TESTNAME.err"
  grep --silent "STATEMENT IS TRUE" "$TESTNAME.log" && {
    TIME=`grep "Benchmarking" "$TESTNAME.log" | head -1 | awk '{print $5}'`
    echo " true ($TIME ms)"
    SUCCESS=$((SUCCESS+1))
    } || {
    test -r "$TESTNAME.result" && {
      tail -1 "$TESTNAME.result" | grep --silent "Boolean Value a = true" && {
        echo -n " Prove command incomplete: "
        cat geogebra.xml | grep -A1 Prove | tail -1 | cut -f2 -d\"
        } || echo " computation issue"
      } || echo " timeout"
    }
  ALL=$((ALL+1))
  done
echo "$SUCCESS successful of $ALL cases"
