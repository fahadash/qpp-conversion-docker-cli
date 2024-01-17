#!/bin/bash


path="/qrda"  

filename="$1"


full_path="${path}/${filename}"

if [ -f "${full_path}" ]; then
  echo "The file ${filename} exists, processing..."
  cd /qpp-conversion-tool
  ./convert.sh "${full_path}"
  
  base_filename="${filename%.*}"
  results_dir="/qrda/results"
  if [ ! -d "$results_dir" ]; then
    mkdir "$results_dir"
  fi
  
  result_file="${base_filename}-qpp.json"
  error_file="${base_filename}-error.json"
 
  if [ -f "$result_file" ]; then
    cp "./${base_filename}-qpp.json" "${results_dir}"
    echo "Result file $result_file Copied to results directory"
  else
    if [ -f "$error_file" ]; then
	cp "./$error_file" "$results_dir"
        echo "Error Occurred in validation, error file $error_file Copied to results directory"
    else
        echo "ERROR! Neither results nor error file was generated"
    fi
  fi

  
else
  echo "Error: The file ${filename} does not exist "
  exit 1  
fi



