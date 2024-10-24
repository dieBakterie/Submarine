from minecraft_utils import (
    json,
    load_template,
    save_file,
    count_files_in_directory,
    create_path,
    get_base_dirs,
    COLORS
)

base_dirs = get_base_dirs()
input_dir = base_dirs['models_input']
output_dir = base_dirs['models_output']

model_files = [
    'white_submarine_1.json',
    'submarines_model_template_1.json',
    'submarines_model_template_2.json',
    'submarines_model_template_3.json',
    'submarines_model_template_4.json'
]

# Path to the model JSON file
json_file_path = create_path(input_dir, model_files[0])
mcfunction_file_path = create_path(input_dir, "spawn_white_submarine.mcfunction")

# Load the JSON model
with open(json_file_path, 'r') as file:
    model_data = json.load(file)

# Prepare the function output
mcfunction_commands = []

# Extract elements (cubes) from the model
elements = model_data.get("elements", [])

# Map textures to Minecraft block names
texture_mapping = {
    "#0": "minecraft:black_wool",
    "#1": "minecraft:white_concrete",
    "#2": "minecraft:black_concrete",
    "#3": "minecraft:gray_concrete",
    "#4": "minecraft:sea_lantern",
    "#5": "minecraft:yellow_concrete",
    "#6": "minecraft:glass"
}

# Iterate over elements (cubes) to create block_display summon commands
for element in elements:
    from_pos = element['from']
    to_pos = element['to']
    rotation = element.get('rotation', {})
    faces = element.get('faces', {})

    # Check for available faces and use one with texture
    block_texture = None
    for face in faces.values():
        if 'texture' in face:
            block_texture = face['texture']
            break

    # If no texture is found, skip the element
    if not block_texture:
        continue

    # Map the texture to the appropriate Minecraft block
    block_name = texture_mapping.get(block_texture, "minecraft:stone")

    # Create translation vector (taking the average position between 'from' and 'to')
    translation = [(from_pos[i] + to_pos[i]) / 2 for i in range(3)]

    # Get rotation angle and axis if available
    angle = rotation.get('angle', 0)
    axis = rotation.get('axis', 'y')  # Default to 'y' axis

    # Initialize rotation vectors
    left_rotation = [0.0, 0.0, 0.0, 0.0]  # Placeholder for left rotation
    right_rotation = [0.0, 0.0, 0.0, 0.0]  # Placeholder for right rotation

    # Apply rotation based on axis
    if axis == 'x':
        left_rotation = [angle, 0, 0, 0]
        right_rotation = [0, 0, -angle, 0]
    elif axis == 'z':
        left_rotation = [0, 0, angle, 0]
        right_rotation = [0, 0, -angle, 0]
    else:
        left_rotation = [0, angle, 0, 0]
        right_rotation = [0, -angle, 0, 0]

    # Transformation array in the required order
    transformation = [
        translation[0], translation[1], translation[2],
        left_rotation[0], left_rotation[1], left_rotation[2], left_rotation[3],
        right_rotation[0], right_rotation[1], right_rotation[2], right_rotation[3],
        1.0, 1.0, 1.0, 1.0,  # Scaling values
        0.0  # Placeholder for additional values if needed
    ]

    # Create summon command for the block_display entity
    summon_command = (
        f'summon minecraft:block_display ~ ~ ~ '
        f'{{block_state:{{Name:"{block_name}",Properties:{{}}}},transformation:[{", ".join(f"{val:.4f}" for val in transformation)}]}}'
    )
    mcfunction_commands.append(summon_command)

# Write the commands to the .mcfunction file
with open(mcfunction_file_path, 'w') as mcfunction_file:
    mcfunction_file.write('\n'.join(mcfunction_commands))

mcfunction_file_path
