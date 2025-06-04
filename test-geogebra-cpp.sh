#!/bin/bash

# This script tests all *.gcl files in GeoGebra, after converting them into .ggb files.
# To avoid annoying error messages in popup windows, run this script like this:
# xvfb-run -a -s "-screen 0 1024x768x24" ./test-geogebra-cpp.sh

GEOGEBRA=`which geogebra-discovery`
TIMEOUT=20
OUT_DIR=`pwd`/Generated/cpp

# Above this point the variables can be freely edited.

mkdir -p "$OUT_DIR"

trap "echo 'Exit forced'" EXIT
trap "echo 'Term forced'" TERM
trap "echo 'Kill forced'" KILL

# Build ADGLibToolkit:
cd Tools/ADG-Lib_filters/c++
mkdir -p build
cd build
TOOLKIT_DIR=`pwd`
cmake ..
make -s || exit 1

cd ../../../../CustomFormats/GCLC/GoranPredovicCollection/points_only
P_DIR=`pwd`
SUCCESS=0
ALL=0
for i in *.gcl; do
  ALL=$((ALL+1))
  cd "$OUT_DIR"
  TESTNAME=`basename $i .gcl`
  echo -n "$TESTNAME..."
  # Convert the .gcl file to .ggb:
  "$TOOLKIT_DIR/adg_lib_converter" "$P_DIR/$i" -o ggb \
    > "$TESTNAME.adg_lib_converter.out" 2> "$TESTNAME.adg_lib_converter.err"
  rm -f geogebra.xml
  # Create geogebra.xml directly and check its form:
 "$TOOLKIT_DIR/adg_lib_converter" "$P_DIR/$i" -o ggbxml 2>/dev/null | grep --silent Prove || {
   echo " hypotheses incomplete"
   rm -f geogebra.xml
   continue
   }
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
        grep --silent "eliminate" "$TESTNAME.log" && {
          echo " timeout in elimination (1)"
        } || {
          echo -n " Prove command incomplete: "
          cat geogebra.xml | grep -A1 Prove | tail -1 | cut -f2 -d\"
          }
        } || {
          grep --silent "STATEMENT IS UNKNOWN" "$TESTNAME.log" && {
            echo " unknown"
          } || {
            grep --silent "STATEMENT IS FALSE" "$TESTNAME.log" && {
              echo " false"
            } || {
              grep --silent "eliminate" "$TESTNAME.log" && {
                echo " timeout in elimination (2)"
              } || echo " computation issue"
            }
          }
        }
      } || echo " timeout"
    }
  done
echo "$SUCCESS successful of $ALL cases"
