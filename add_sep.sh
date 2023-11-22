#!/bin/bash

input_file="modified_gitlab.yml"
output_file="final_gitlab_ci.yml"

awk '
  /^[^[:space:]]/ {
    if (NR > 1) {
      print "\n\n#----------------------------------------------------------------------------------------------------------------------\n\n"
    }
  }
  {print}
' "$input_file" > "$output_file"



