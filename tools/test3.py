from minecraft_utils import (
    COLORS,
    save_file,
    create_path,
    get_base_dir,
    list_files_in_directory,
    get_file_name,
    get_versioned_dirs,
    load_template,
    setup_logging,
    log_message,
    ensure_dir_exists,
    dir_exists,
    count_files_in_directory
)

# Erstelle die Ausgaben
commands = []
for color in COLORS.keys():
    command = f'execute as @n[name="Remove {color} Submarine"] at @s run function submarine:remove/{color}_submarine'
    commands.append(command)

# Ausgabe der generierten Befehle
for command in commands:
    print(command)
