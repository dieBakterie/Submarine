from minecraft_utils import (
    setup_logging,
    log_message,
    get_base_dirs,
    create_path,
    get_versioned_dirs,
    count_files_in_directory
)

# Debug Funktion mit Logging
def debug():
    base_dirs = get_base_dirs()

    log_message("Base Directories:")
    for key, value in base_dirs.items():
        log_message(f'{key}: {value}')

    input_dirs_animation = get_versioned_dirs(base_dirs['animations_input'], '')
    input_dirs_model = get_versioned_dirs(base_dirs['models_input'], '')
    input_dirs_recipe = get_versioned_dirs(base_dirs['recipes_input'], '')
    input_dirs_remove = get_versioned_dirs(base_dirs['removes_input'], '')
    input_dirs_spawn = get_versioned_dirs(base_dirs['spawns_input'], '')
    output_dirs_animation = get_versioned_dirs(base_dirs['animations_output'], '')
    output_dirs_model = get_versioned_dirs(base_dirs['models_output'], '')
    output_dirs_recipe = get_versioned_dirs(base_dirs['recipes_output'], '')
    output_dirs_remove = get_versioned_dirs(base_dirs['removes_output'], '')
    output_dirs_spawn = get_versioned_dirs(base_dirs['spawns_output'], '')

    log_message("\n\nAnimation Input Directories:")
    for version, path in input_dirs_animation.items():
        log_message(f'{version}: {path}')

    log_message("\n\nAnimation Output Directories:")
    for version, path in output_dirs_animation.items():
        log_message(f'{version}: {path}')

    log_message("\n\nModel Input Directories:")
    for version, path in input_dirs_model.items():
        log_message(f'{version}: {path}')

    log_message("\n\nModel Output Directories:")
    for version, path in output_dirs_model.items():
        log_message(f'{version}: {path}')

    log_message("\n\nRecipe Input Directories:")
    for version, path in input_dirs_recipe.items():
        log_message(f'{version}: {path}')

    log_message("\n\nRecipe Output Directories:")
    for version, path in output_dirs_recipe.items():
        log_message(f'{version}: {path}')

    log_message("\n\nRemove Input Directories:")
    for version, path in input_dirs_remove.items():
        log_message(f'{version}: {path}')

    log_message("\n\nRemove Output Directories:")
    for version, path in output_dirs_remove.items():
        log_message(f'{version}: {path}')

    log_message("\n\nSpawn Input Directories:")
    for version, path in input_dirs_spawn.items():
        log_message(f'{version}: {path}')

    log_message("\n\nSpawn Output Directories:")
    for version, path in output_dirs_spawn.items():
        log_message(f'{version}: {path}')

    log_message("\n\nFile Count:")
    for version, path in base_dirs.items():
        log_message(f'{version}: {count_files_in_directory(path)}')

# Setup Logging
setup_logging('debug_logs', 'debug.log')

# Funktion aufrufen
debug()
