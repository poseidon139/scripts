import re

# Specify the file path
file_path = ".gitlab-ci.yml"

# Specify the new version
new_version = "v3.3.2-full"

# Regular expression pattern to match the image line
pattern = r'image:\s*cr\.siemens\.com/industrial-edge/tools/build-images/hub/common-build-image:[^\s]+'

# Open the file in read mode
with open(file_path, 'r') as file:
    # Read the content of the file
    file_content = file.read()

    # Use a regular expression to find and replace the image line
    updated_content = re.sub(pattern, f'image: cr.siemens.com/industrial-edge/tools/build-images/hub/common-build-image:{new_version}', file_content)

# Open the file in write mode and overwrite its content
with open(file_path, 'w') as file:
    file.write(updated_content)

print(f"The version of the common build image in {file_path} has been updated to {new_version}")
