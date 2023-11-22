#!/bin/bash

input_file="outputscp-gitlab-ci.yml"
output_file="modified_gitlab.yml"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file not found: $input_file"
  exit 1
fi

# Remove lines containing the specified pattern
grep -v '#----------------------------------------------------------------------------------------------------------------------' "$input_file" > "$output_file"

echo "Modified file created: $output_file"
