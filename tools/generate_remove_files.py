from minecraft_utils import (
    ensure_dir_exists,
    setup_logging,
    log_message,
    get_base_dir,
    list_files_in_directory,
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

    # Hole die Eingabe- und Ausgabe-Verzeichnisse für Remove-Dateien
    removes_output_dir = get_base_dir('removes_output')
    removes_input_dir = get_base_dir('removes_input')

    # Hole die versionsspezifischen Verzeichnisse
    versioned_removes_output_dirs = get_versioned_dirs(removes_output_dir, '')
    versioned_removes_input_dirs = get_versioned_dirs(removes_input_dir, '')

    custom_model_data_start = 1  # Starte bei 1 für die erste Farbe

    # Jetzt die farbspezifischen Dateien erstellen
    for index, (color, hex_code) in enumerate(COLORS.items()):
        # Berechne den Custom Model Data Wert für die aktuelle Farbe
        custom_model_data = custom_model_data_start + (index * 4)

        # Schleife über jede Version
        for version in VERSIONS:
            output_dir = versioned_removes_output_dirs[version]
            input_dir = versioned_removes_input_dirs[version]

            # Erstelle den Ausgabeordner, falls er nicht existiert
            ensure_dir_exists(output_dir)

            # Lade die Remove-Vorlage
            remove_files = list_files_in_directory(input_dir)
            log_message(f'Lade Remove-Vorlage {remove_files}...')

            # Lade die Vorlage für die Remove-Datei
            template_file = remove_files[0]
            file_content = load_template(template_file)

            # Erstelle die Remove-Datei für die jeweilige Farbe und Version
            output_file_path = create_path(output_dir, f'remove_{color}_submarine.mcfunction')
            log_message(f'Erstelle {output_file_path}...')

            # Ersetze die Platzhalter in der Vorlage
            file_content = file_content.replace('{color}', color).replace('hex_code', hex_code)

            if version <= '1.21.1':
                # Ersetze die Platzhalter für vorwärtsgerichtete Animation (1 bis 4)
                for i in range(1, 5):  # Immer 4 Schritte
                    animation_step = custom_model_data + (i - 1)
                    file_content = file_content.replace('animation_step', str(animation_step), 1)

            # Speichere die finale Datei
            save_file(file_content, output_file_path)

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
