#!/bin/bash

#set -e

# Example of translation pipeline

InputFolder="CustomFormats/GCLC/GoranPredovicCollection/points_only"
#InputFolder="CustomFormats/GCLC/samples_prover/"  

OutputFolder="Generated"
mkdir -p "$OutputFolder"
	
for file in ${InputFolder}/thm_0284*.gcl
	do
		echo "  "
                filenameext=$(basename "$file")
                filename="${filenameext%.*}"

		cp Tools/GCLC-XML-tools/GeoCons.dtd "${OutputFolder}"/.
		cp CustomFormats/GCLC/gclc_proof.sty "${OutputFolder}"/.

		echo "**************************************"
		echo "Exporting file $file to ${OutputFolder}/$filename.xml: "
		cp "${InputFolder}/$filename".gcl "${OutputFolder}"/tmp_"$filename".gcl
		cd ${OutputFolder}
		gclc tmp_"$filename".gcl -xml -w
		echo "--------------------------------------"		
		echo "Exporting file "${OutputFolder}/tmp_"$filename".xml to ${OutputFolder}/tmp_1_"$filename".p: 		
		xsltproc ../Tools/GCLC-XML-tools/GeoConsTPTP.xsl tmp_"$filename".xml > tmp_1_"$filename".p
		echo "--------------------------------------"		
		echo "Converting ${OutputFolder}/tmp_1_"$filename".p to points-only ${OutputFolder}/tmp_2_"$filename".p: "		
		../Tools/ADG-Lib_tools/ADGLibToolkit tmp_1_"$filename".p "tmp_2_$filename".p -lines2points
		
		echo "--------------------------------------"		
		echo "Converting ${OutputFolder}/tmp_2_"$filename".p to lines-only ${OutputFolder}/tmp_3_"$filename".p: "		
		../Tools/ADG-Lib_tools/ADGLibToolkit tmp_2_"$filename".p "tmp_3_$filename".p -points2lines

		#echo "--------------------------------------"		
		#echo "Removing from ${OutputFolder}/tmp_1_"$filename".p layout info to ${OutputFolder}/tmp_3_"$filename".p: "		
		#GeoTPTP-tools/ADGLibToolkit ${OutputFolder}/tmp_1_"$filename".p ${OutputFolder}/tmp_3_"$filename".p -r

                # keep points only
		echo "--------------------------------------"		
		echo "Converting ${OutputFolder}/tmp_3_"$filename".p to premises=>goal ${OutputFolder}/${filename}.p: "		
		../Tools/ADG-Lib_tools/ADGLibToolkit tmp_2_"$filename".p ${filename}.p -p
		echo "--------------------------------------"		
		echo "Remove 'obj' prefix from variable names in ${OutputFolder}/"$filename".p: "		
		sed -i "s,obj,,g" "$filename".p
		echo "--------------------------------------"		
		#echo "Invoking vampire on ${OutputFolder}/"$filename".p: "		
		#vampire ${OutputFolder}/"$filename".p --mode casc --cores 4 --time_limit 5
		echo "--------------------------------------"		
		echo "Translating file ${OutputFolder}/"$filename".p to ${OutputFolder}/${filename}.gcl : "		
		../Tools/ADG-Lib_tools/ADGLibToolkit "$filename".p ${filename}.gcl -gclc
		echo "--------------------------------------"		
		#echo "Translating file ${OutputFolder}/"$filename".p to ${OutputFolder}/${filename}.geogebra : "		
		#../Tools/ADG-Lib_tools/ADGLibToolkit "$filename".p ${filename}.geogebra -geogebra
		#echo "--------------------------------------"				
		# echo "Diff $file and ${OutputFolder}/"$filename".gcl : "
		# diff tmp_"$filename".gcl "$filename".gcl  
		echo "--------------------------------------"				
		echo "Proving $file and ${OutputFolder}/"$filename".gcl "
		gclc tmp_"$filename".gcl -w > tmp_1_gclcproof.txt
		gclc "$filename".gcl -w > tmp_2_gclcproof.txt
		echo "--------------------------------------"				
		echo "Diff proofs ${OutputFolder}/tmp_${filename}_proof.tex and ${OutputFolder}/"${filename}"_proof.tex  "
		#diff ${OutputFolder}/tmp_${filename}_proof.tex ${OutputFolder}/${filename}_proof.tex
		diff tmp_1_gclcproof.txt tmp_2_gclcproof.txt
		cd ..
		echo "  "		
        done 



