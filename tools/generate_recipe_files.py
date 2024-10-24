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

def create_recipe_files():
    log_message("Erstelle Rezept-Dateien...")

    # Hole das Eingabe- und Ausgabe-Verzeichnis
    recipes_output_dir = get_base_dir('recipes_output')
    recipes_input_dir = get_base_dir('recipes_input')

    # Erstelle das Ausgabe-Verzeichnis, falls es nicht existiert
    ensure_dir_exists(recipes_output_dir)

    # Hole die versionsspezifischen Verzeichnisse
    versioned_recipes_output_dirs = get_versioned_dirs(recipes_output_dir, '')
    versioned_recipes_input_dirs = get_versioned_dirs(recipes_input_dir, '')

    # Starte bei 1 für die erste Farbe
    custom_model_data_start = 1

    # Schleife über jede Version
    for version in VERSIONS:
        # Hole die Verzeichnisse für die aktuelle Version
        version_output_dir = versioned_recipes_output_dirs[version]
        version_input_dir = versioned_recipes_input_dirs[version]

        # Erstelle das Versionsspezifische Ausgabe-Verzeichnis, falls es nicht existiert
        ensure_dir_exists(version_output_dir)

        # Hole die versionsspezifischen Rezeptdateien
        versioned_recipe_files = list_files_in_directory(version_input_dir)

        # Für jede versionsspezifische Datei die farbspezifischen Dateien erstellen
        for recipe_file in versioned_recipe_files:
            recipe_file_name = get_file_name(recipe_file)
            versioned_template_content = load_template(recipe_file)

            for index, (color, hex_code) in enumerate(COLORS.items()):
                # Berechne den Custom Model Data Wert für die aktuelle Farbe
                custom_model_data = custom_model_data_start + (index * 4)

                # Erstelle die Rezeptdatei für die jeweilige Farbe
                output_file_path = create_path(version_output_dir, f"{color}_{recipe_file_name}")

                # Ersetze die Platzhalter in der versionsspezifischen Vorlage
                file_content = versioned_template_content.replace('{color}', color).replace('hex_code', hex_code)

                if version <= '1.21.1':
                    # Ersetze die Platzhalter für vorwärtsgerichtete Animation (1 bis 4)
                    for i in range(1, 5):  # Immer 4 Schritte
                        animation_step = custom_model_data + (i - 1)
                        file_content = file_content.replace('animation_step', str(animation_step), 1)

                # Speichere die farbspezifische Datei
                save_file(file_content, output_file_path)
                log_message(f"Farbspezifische Rezeptdatei: {output_file_path} erfolgreich erstellt.")

        log_message(f"Erfolgreich alle {len(COLORS)} farbspezifischen Rezeptdateien für Version {version} erstellt.")

    # Ausgabe der Ergebnisse
    log_message("\nDatei-Anzahl pro Version in den Rezept-Ausgabeverzeichnissen:")
    for version, path in versioned_recipes_output_dirs.items():
        file_count = count_files_in_directory(path, '.json')
        log_message(f"{version}: {file_count} Dateien")

    total_files = sum(count_files_in_directory(path, '.json') for path in versioned_recipes_output_dirs.values())
    log_message(f"\nErfolgreich alle {total_files} json-Dateien für die Rezepte erstellt.")

# Setze die Logging-Datei
setup_logging('recipe_logs', 'generate_recipes.log')

# Erstelle die Rezeptdateien
create_recipe_files()
