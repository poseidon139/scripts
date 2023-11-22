def remove_comments(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            if not line.strip().startswith('#'):
                outfile.write(line)

# Call the function with your input and output file paths
remove_comments('.gitlab-ci.yml', 'output.yml')

