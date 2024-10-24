from minecraft_utils import (
    ensure_dir_exists,
    setup_logging,
    log_message,
    get_base_dir,
    dir_exists,
    create_dir,
    list_files_in_directory,
    create_path,
    get_file_name,
    load_template,
    save_file,
    count_files_in_directory,
    COLORS
)

def create_model_files():
    input_dir = get_base_dir('models_input')
    output_dir = get_base_dir('models_output')

    # Erstelle das Ausgabe-Verzeichnis, falls es nicht existiert
    ensure_dir_exists(output_dir)

    # Liste alle Modellvorlagen auf
    model_files = list_files_in_directory(input_dir)

    # Farbverzeichnisse einmalig erstellen
    log_message("Starte die Erstellung der Modellverzeichnisse...", 'warning')
    color_dirs = {}
    for color in COLORS.keys():
        color_output_dir = create_path(output_dir, color)
        if not dir_exists(color_output_dir):
            create_dir(color_output_dir)
            log_message(f"Verzeichnis für {color} erstellt.", 'warning')
        color_dirs[color] = color_output_dir
    log_message("Modellverzeichnisse erfolgreich erstellt.")

    # Verarbeitung der Modellvorlagen
    log_message("Starte die Erstellung der Modelldateien...")
    for model_file_path in model_files:
        model_file_name = get_file_name(model_file_path)

        # Lade die Modellvorlage
        content = load_template(model_file_path)

        # Für jede Farbe die spezifischen Modell-Dateien erstellen
        for color, color_output_dir in color_dirs.items():
            modified_content = content.replace('quartz_block_top', f'{color}_concrete')

            # Erstelle die Modell-Datei
            output_file_name = f'{color}_{model_file_name}'  # Fügt den Farbnamen vor den Dateinamen
            output_file_path = create_path(color_output_dir, output_file_name)
            save_file(modified_content, output_file_path)
            log_message(f"Modell-Datei {output_file_name} erfolgreich erstellt.")
    log_message("Modell-Dateien erfolgreich erstellt.")

    # Zähle Dateien und zeige zusammengefasste Ergebnisse
    file_count_per_color = {color: count_files_in_directory(dir_path) for color, dir_path in color_dirs.items()}
    total_files = sum(file_count_per_color.values())

    # Ausgabe der Ergebnisse
    log_message("Verzeichnisübersicht:")
    for color, path in color_dirs.items():
        log_message(f"{color.capitalize()} - {file_count_per_color[color]} Dateien")

    log_message(f"Insgesamt {total_files} JSON-Dateien erfolgreich erstellt.")

# Setup Logging aufrufen
setup_logging('model_logs', 'generate_model_files.log')

# Funktion aufrufen
create_model_files()
