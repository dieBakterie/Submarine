import os
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
    COLORS,
    VERSIONS
)

def create_spawn_files():
    log_message("Erstelle spawns-Dateien...")

    # Hole das Ausgabe-Verzeichnis
    spawns_output_dir = get_base_dir('spawns_output')

    # Erstelle das Ausgabe-Verzeichnis, falls es nicht existiert
    ensure_dir_exists(spawns_output_dir)

    # Hole die Basisverzeichnisse
    spawns_input_dir = get_base_dir('spawns_input')

    # Hole die versionsspezifischen Verzeichnisse
    versioned_spawns_output_dirs = get_versioned_dirs(spawns_output_dir, '')
    versioned_spawns_input_dirs = get_versioned_dirs(spawns_input_dir, '')

    # Starte bei 1 für die erste Farbe
    custom_model_data_start = 1

    # Schleife über jede Version
    for version in VERSIONS:
        version_output_dir = versioned_spawns_output_dirs[version]
        version_input_dir = versioned_spawns_input_dirs[version]

        # Erstelle das Versionsspezifische Ausgabe-Verzeichnis, falls es nicht existiert
        ensure_dir_exists(version_output_dir)

        log_message(f"Erstelle farbspezifische spawnsdateien für Version {version}...")

        # Funktion, um die Dateien in einem Verzeichnis zu verarbeiten
        def process_directory(directory, output_directory):
            versioned_spawn_files = list_files_in_directory(directory)

            for spawn_file in versioned_spawn_files:
                spawn_file_name = get_file_name(spawn_file)
                versioned_template_content = load_template(spawn_file)

                for index, (color, hex_code) in enumerate(COLORS.items()):
                    custom_model_data = custom_model_data_start + (index * 4)
                    output_file_path = create_path(output_directory, f"{color}_{spawn_file_name}")

                    # Ersetze die Platzhalter in der Vorlage
                    file_content = versioned_template_content.replace('{color}', color).replace('hex_code', hex_code)

                    # Für Versionen <= 1.21.1 müssen Animationen ersetzt werden
                    if version <= '1.21.1':
                        for i in range(1, 5):
                            animation_step = custom_model_data + (i - 1)
                            file_content = file_content.replace('animation_step', str(animation_step), 1)

                    # Datei speichern
                    save_file(file_content, output_file_path)
                    log_message(f"{output_file_path} erfolgreich erstellt.")

        # Verarbeite die Dateien im Hauptverzeichnis der Version
        process_directory(version_input_dir, version_output_dir)

        # Verarbeite die Unterordner innerhalb des Versionsverzeichnisses
        for subdir in os.listdir(version_input_dir):
            subdir_path = create_path(version_input_dir, subdir)

            if os.path.isdir(subdir_path):
                # Repliziere die Verzeichnisstruktur im Ausgabe-Verzeichnis
                output_subdir = create_path(version_output_dir, subdir)
                ensure_dir_exists(output_subdir)

                process_directory(subdir_path, output_subdir)

        log_message(f"Erfolgreich alle {len(COLORS)} farbspezifischen spawn-Dateien für Version {version} erstellt.")

    # Logge die Anzahl der Dateien pro Version
    log_message("Datei-Anzahl pro Version in den spawns Ausgabe-Verzeichnissen:")
    for version, path in versioned_spawns_output_dirs.items():
        file_count = count_files_in_directory(path, '.mcfunction')
        log_message(f"{version}: {file_count} Dateien")

    total_files = sum(count_files_in_directory(path, '.mcfunction') for path in versioned_spawns_output_dirs.values())
    log_message(f"Erfolgreich alle {total_files} mcfunction-Dateien fürs spawnen erstellt.")

setup_logging('spawn_logs', 'generate_spawn_files.log')

create_spawn_files()
