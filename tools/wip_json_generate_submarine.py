import os
import json
import re

# List of 16 Minecraft colors
colors = [
    "black", "blue", "brown", "cyan", "gray", 
    "green", "light_blue", "light_gray", "lime", "magenta", 
    "orange", "pink", "purple", "red", "white", "yellow"
]

# List of submarine .json files
submarines = [
    "submarine_model_template_1.json",
    "submarine_model_templatesubmarine_2.json",
    "submarine_model_template_submarine_3.json",
    "submarine_model_template_submarine_4.json"
]

# Create output directory if it doesn't exist
output_dir = 'submarine_models'
os.makedirs(output_dir, exist_ok=True)

def format_json_string(json_str):
    # Insert newline after comma for specific keys while preserving original indentation
    keys = [
        r', "to"', r', "rotation"', r', "faces"', r', "from"',
        r', "west"', r', "east"', r', "south"', r', "up"',
        r', "down"', r', "north"'
    ]
    
    for key in keys:
        json_str = re.sub(key, lambda m: ',\n' + ' ' * m.start() + m.group(0)[2:], json_str)

    # Collapse arrays and objects that should be inline
    json_str = re.sub(r'\[\s*([^\[\]]+?)\s*\]', lambda m: '[' + re.sub(r'\s+', ' ', m.group(1)) + ']', json_str)
    json_str = re.sub(r'\{\s*([^\{\}]+?)\s*\}', lambda m: '{' + re.sub(r'\s+', ' ', m.group(1)) + '}', json_str)
    
    # Adjust indentation for nested structures
    json_str = re.sub(r'(\[\n\s*)([^\]]+?)(\n\s*\])', lambda m: '[\n' + re.sub(r'\n\s*', ' ', m.group(2)) + '\n]', json_str)
    json_str = re.sub(r'(\{\n\s*)([^\}]+?)(\n\s*\})', lambda m: '{\n' + re.sub(r'\n\s*', ' ', m.group(2)) + '\n}', json_str)
    
    # Ensure proper spacing after commas and colons
    json_str = re.sub(r',\s+', ', ', json_str)
    json_str = re.sub(r':\s+', ': ', json_str)

    # Re-insert line breaks where necessary to match desired format
    json_str = re.sub(r'(\}\,)\s*\{', r'\1\n\n{', json_str)
    json_str = re.sub(r'(\])\s*\[', r'\1\n\n[', json_str)
    
    # Insert line breaks before specific keys for better readability
    json_str = re.sub(r'(\},\s*{\s*"name")', r'},\n\n{\n    "name"', json_str)

    return json_str

# Load each submarine model template JSON file and generate the colored versions
for submarine in submarines:
    with open(submarine, 'r') as file:
        content = json.load(file)  # Load JSON file as Python object

    for color in colors:
        # Create the path for the output file
        index = submarine.split('_')[3].split('.')[0]
        output_file = os.path.join(output_dir, f'submarine_{color}_{index}.json')

        # Replace the texture reference in the JSON structure
        new_content = json.loads(json.dumps(content))  # Deep copy of the JSON structure
        for key, value in new_content['textures'].items():
            if value == 'block/quartz_block_top':
                new_content['textures'][key] = f'block/{color}_concrete'

        # Dump the JSON to a string with standard formatting
        json_string = json.dumps(new_content, indent=4, separators=(',', ': '))

        # Post-process the JSON string for custom formatting
        formatted_json_string = format_json_string(json_string)

        # Write the processed JSON to the output file
        with open(output_file, 'w') as file:
            file.write(formatted_json_string)

print(f"The files have been successfully generated and saved in the '{output_dir}' folder.")
