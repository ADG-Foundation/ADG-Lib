# Make sure to install swi-prolog-full on Ubuntu to have all dependencies.
ADGLibToolkit: ADGLibToolkit.pl axioms2premises_module.pl gclc_module.pl geocoq_module.pl geogebra_module.pl \
 lines2points_module.pl points2lines_module.pl misc.pl prolog_module.pl provers_module.pl removeLayout_module.pl
	swipl -o ADGLibToolkit -t run -c ADGLibToolkit.pl --stand_alone=true

clean:
	rm -f ADGLibToolkit

.PHONY: clean
