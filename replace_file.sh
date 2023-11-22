#!/bin/bash

input_file="final_gitlab_ci.yml"
original_file=".gitlab-ci.yml"

# Replace the original file with the modified one
mv "$input_file" "$original_file"

echo "Original YAML file replaced with the modified one."
