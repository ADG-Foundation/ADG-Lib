#!/bin/bash

set -e

# Example of translation pipeline

InputFolder="CustomFormats/GCLC/GoranPredovicCollection/points_only" 
OutputFolder="Generated"
mkdir -p "$OutputFolder"

for file in ${InputFolder}/thm_0*.gcl
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
		echo "Exporting file "${InputFolder}/$filename".xml to ${OutputFolder}/tmp_1_"$filename".p: "		
		xsltproc ../Tools/GCLC-XML-tools/GeoConsTPTP.xsl tmp_"$filename".xml > tmp_1_"$filename".p
		echo "--------------------------------------"		
		echo "Converting ${OutputFolder}/tmp_1_"$filename".p to points-only ${OutputFolder}/tmp_2_"$filename".p: "		
		../Tools/ADG-Lib_tools/ADGLibToolkit tmp_1_"$filename".p "tmp_2_$filename".p -l
		echo "--------------------------------------"		
		#echo "Removing from ${OutputFolder}/tmp_1_"$filename".p layout info to ${OutputFolder}/tmp_3_"$filename".p: "		
		#GeoTPTP-tools/ADGLibToolkit ${OutputFolder}/tmp_1_"$filename".p ${OutputFolder}/tmp_3_"$filename".p -r
		echo "--------------------------------------"		
		echo "Converting ${OutputFolder}/tmp_2_"$filename".p to premises=>goal ${OutputFolder}/${filename}.p: "		
		../Tools/ADG-Lib_tools/ADGLibToolkit tmp_2_"$filename".p ${filename}.p -p
		echo "--------------------------------------"		
		echo "Remove 'obj' prefix from variable names in ${OutputFolder}/"$filename".p: "		
		sed -i "s,obj,,g" "$filename".p
		echo "--------------------------------------"		
		#echo "Invoking vampire on ${OutputFolder}/"$filename".p: "		
		#vampire ${OutputFolder}/"$filename".p --mode casc --cores 4 --time_limit 5
		echo "--------------------------------------"		
		echo "Translating file ${OutputFolder}/"$filename".p to ${OutputFolder}/${filename}.gcl : "		
		../Tools/ADG-Lib_tools/ADGLibToolkit "$filename".p ${filename}.gcl -g
		echo "--------------------------------------"				
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



