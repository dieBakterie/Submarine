from minecraft_utils import (
    ensure_dir_exists,
    setup_logging,
    log_message,
    get_base_dir,
    list_files_in_directory,
    get_file_name,
    get_versioned_dirs,
    create_path,
    load_template,
    save_file,
    count_files_in_directory,
    dir_exists,
    COLORS,
    VERSIONS
)

def create_animation_files():
    log_message("Erstelle Animations-Dateien...")

    # Hole das Ausgabe-Verzeichnis
    animations_output_dir = get_base_dir('animations_output')

    # Erstelle das Ausgabe-Verzeichnis, falls es nicht existiert
    ensure_dir_exists(animations_output_dir)

    # Hole die Basisverzeichnisse
    animations_input_dir = get_base_dir('animations_input')
    animation_files = list_files_in_directory(animations_input_dir)
    
    if not animation_files:
        log_message("Keine globalen Animation-Templates gefunden. Abbruch...")
        return

    global_template_path = create_path(animations_input_dir, animation_files[0])

    # Hole die versionsspezifischen Verzeichnisse
    versioned_animations_output_dirs = get_versioned_dirs(animations_output_dir, '')
    versioned_animations_input_dirs = get_versioned_dirs(animations_input_dir, '')

    # Starte bei 1 für die erste Farbe
    custom_model_data_start = 1

    # Schleife über jede Version
    for version in VERSIONS:
        version_output_dir = versioned_animations_output_dirs.get(version)
        version_input_dir = versioned_animations_input_dirs.get(version)

        # Überprüfen, ob das Eingabeverzeichnis für die Version existiert
        if not dir_exists(version_input_dir):
            log_message(f"Kein Unterordner für Version {version} gefunden. Überspringe diese Version...")
            continue

        # Überprüfen, ob es Dateien im Eingabeverzeichnis gibt
        versioned_animation_files = list_files_in_directory(version_input_dir)
        if not versioned_animation_files:
            log_message(f"Keine Templates für Version {version} gefunden. Überspringe diese Version...")
            continue

        # Erstelle das Versionsspezifische Ausgabe-Verzeichnis, falls es nicht existiert
        ensure_dir_exists(version_output_dir)

        global_file_name = get_file_name(global_template_path)
        file_path_global = create_path(version_output_dir, global_file_name)
        log_message(f"Kopiere globale Animationsdatei {file_path_global}...")

        global_template_content = load_template(global_template_path)
        save_file(global_template_content, file_path_global)
        log_message(f"{file_path_global} erfolgreich erstellt.")

        log_message(f"Erstelle farbspezifische Animationsdateien für Version {version}...")

        for animation_file in versioned_animation_files:
            animation_file_name = get_file_name(animation_file)
            versioned_template_content = load_template(animation_file)

            for index, (color, hex_code) in enumerate(COLORS.items()):
                custom_model_data = custom_model_data_start + (index * 4)
                output_file_path = create_path(version_output_dir, f"{color}_{animation_file_name}")

                file_content = versioned_template_content.replace('{color}', color).replace('hex_code', hex_code)

                if version <= '1.21.1':
                    for i in range(1, 5):
                        animation_step = custom_model_data + (i - 1)
                        file_content = file_content.replace('animation_step', str(animation_step), 1)

                    for i in range(1, 5):
                        animation_step = custom_model_data + (4 - i)
                        file_content = file_content.replace('animation_step', str(animation_step), 1)

                save_file(file_content, output_file_path)
                log_message(f"{output_file_path} erfolgreich erstellt.")

        log_message(f"Erfolgreich alle {len(COLORS)} farbspezifischen Animations-Dateien für Version {version} erstellt.")

    log_message("Datei-Anzahl pro Version in den Animations Ausgabe-Verzeichnissen:")
    for version, path in versioned_animations_output_dirs.items():
        file_count = count_files_in_directory(path, '.mcfunction')
        log_message(f"{version}: {file_count} Dateien")

    total_files = sum(count_files_in_directory(path, '.mcfunction') for path in versioned_animations_output_dirs.values())
    log_message(f"Erfolgreich alle {total_files} mcfunction-Dateien für die Animationen erstellt.")

# Setup Logging
setup_logging('animation_logs', 'generate_animation_files.log')

# Funktion aufrufen
create_animation_files()
