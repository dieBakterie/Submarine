from minecraft_utils import (
    setup_logging,
    log_message,
    get_base_dir,
    ensure_dir_exists,
    dir_exists,
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

def create_remove_files():
    log_message("Erstelle Remove-Dateien...")

    # Hole die Eingabe-Verzeichnis für Remove-Dateien
    removes_output_dir = get_base_dir('removes_output')

    # Erstelle das Ausgabe-Verzeichnis, falls es nicht existiert
    ensure_dir_exists(removes_output_dir)

    # Hole die Basisverzeichnisse
    removes_input_dir = get_base_dir('removes_input')
    removes_files = list_files_in_directory(removes_input_dir)
    
    if not removes_files:
        log_message("Keine globalen Remove-Templates gefunden. Abbruch...")
        return

    global_template_path = create_path(removes_input_dir, removes_files[0])

    # Hole die versionsspezifischen Verzeichnisse
    versioned_removes_output_dirs = get_versioned_dirs(removes_output_dir, '')
    versioned_removes_input_dirs = get_versioned_dirs(removes_input_dir, '')

    custom_model_data_start = 1  # Starte bei 1 für die erste Farbe

    # Schleife über jede Version
    for version in VERSIONS:
        version_output_dir = versioned_removes_output_dirs[version]
        version_input_dir = versioned_removes_input_dirs[version]

        # Überprüfen, ob das Eingabeverzeichnis für die Version existiert
        if not dir_exists(version_input_dir):
            log_message(f"Kein Unterordner für Version {version} gefunden. Überspringe diese Version...")
            continue

        # Überprüfen, ob es Dateien im Eingabeverzeichnis gibt
        versioned_remove_files = list_files_in_directory(version_input_dir)
        if not versioned_remove_files:
            log_message(f"Keine Templates für Version {version} gefunden. Überspringe diese Version...")
            continue

        # Erstelle den Ausgabeordner, falls er nicht existiert
        ensure_dir_exists(version_output_dir)
        
        global_file_name = get_file_name(global_template_path)
        file_path_global = create_path(version_output_dir, global_file_name)
        log_message(f"Kopiere globale Removesdatei {file_path_global}...")

        global_template_content = load_template(global_template_path)
        save_file(global_template_content, file_path_global)
        log_message(f"{file_path_global} erfolgreich erstellt.")
        
        log_message(f"Erstelle farbspezifische Removesdateien für Version {version}...")

        for remove_file in versioned_remove_files:
            remove_file_name = get_file_name(remove_file)
            versioned_template_content = load_template(remove_file)
            
            # Jetzt die farbspezifischen Dateien erstellen
            for index, (color, hex_code) in enumerate(COLORS.items()):
                # Berechne den Custom Model Data Wert für die aktuelle Farbe
                custom_model_data = custom_model_data_start + (index * 4)
                output_file_path = create_path(version_output_dir, f'{color}_{remove_file_name}')

                # Ersetze die Platzhalter in der Vorlage
                file_content = versioned_template_content.replace('{color}', color).replace('hex_code', hex_code)

                if version <= '1.21.1':
                    # Ersetze die Platzhalter für vorwärtsgerichtete Animation (1 bis 4)
                    for i in range(1, 5):  # Immer 4 Schritte
                        animation_step = custom_model_data + (i - 1)
                        file_content = file_content.replace('animation_step', str(animation_step), 1)

                # Speichere die finale Datei
                save_file(file_content, output_file_path)
                log_message(f"{output_file_path} erfolgreich erstellt.")
                
        log_message(f"Erfolgreich alle {len(COLORS)} farbspezifischen Removes-Dateien für Version {version} erstellt.")

    # Ausgabe der Ergebnisse
    log_message("Remove-Dateien in den Ausgabeverzeichnissen:")
    for version, path in versioned_removes_output_dirs.items():
        file_count = count_files_in_directory(path, '.mcfunction')
        log_message(f"{version}: {file_count} Dateien")

    total_files = sum(count_files_in_directory(path, '.mcfunction') for path in versioned_removes_output_dirs.values())
    log_message(f"Erfolgreich alle {total_files} mcfunction-Dateien für die Remove-Dateien erstellt.")

# Setup Logging
setup_logging('remove_logs', 'generate_remove_files.log')

# Starte mit der Erstellung der Remove-Dateien
create_remove_files()
