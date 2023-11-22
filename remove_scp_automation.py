
import re

def extract_and_filter_blocks(file_path, output_file, separator="#----", filter_word="scpautomation"):
    with open(file_path, 'r') as file:
        content = file.read()

    # Use regular expression to split content into blocks based on the dynamic separator
    blocks = re.split(re.escape(separator), content)

    # Filter out blocks containing the specified word
    filtered_blocks = [block.strip() for block in blocks if filter_word not in block]

    # Write the filtered blocks to the output file
    with open(output_file, 'w') as out_file:
        for filtered_block in filtered_blocks:
            out_file.write(filtered_block)
            out_file.write("\n")
            out_file.write(separator)  # Add the separator back for each block

if __name__ == "__main__":
    # Specify the file path and output file path
    file_path = ".gitlab-ci.yml"
    output_file_path = "outputscp-gitlab-ci.yml"

    # Specify the dynamic separator and word to filter
    dynamic_separator = "#----"  # Change this to your actual dynamic separator
    filter_word = "scpautomation"  # Change this to the word to filter

    # Extract, filter, and write blocks to the output file
    extract_and_filter_blocks(file_path, output_file_path, dynamic_separator, filter_word)
