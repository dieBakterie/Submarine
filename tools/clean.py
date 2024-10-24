from minecraft_utils import (
    setup_logging,
    log_message,
    get_base_dirs,
    create_path,
    dir_exists,
    list_files_in_directory,
    count_files_in_directory,
    delete_dir
)

def clean_generated_files():
    base_dirs = get_base_dirs()
    output_dir = create_path(base_dirs['output'])

    # Prüfe, ob das Verzeichnis existiert
    if dir_exists(output_dir):
        log_message('Lösche alle generierten Dateien...')

        # Liste alle Dateien und Ordner auf, bevor sie gelöscht werden
        files_to_delete = list_files_in_directory(output_dir)
        if files_to_delete:
            log_message("Zu löschende Dateien und Ordner:")
            for file in files_to_delete:
                log_message(f'{file}')
        else:
            log_message("Keine Dateien zum Löschen gefunden.", level='warning')

        total_files = count_files_in_directory(output_dir)
        log_message(f"Es wurden {total_files} generierte Dateien gefunden.")
        delete_dir(output_dir)
        log_message(f"Alle {total_files} generierten Dateien wurden gelöscht.")

    else:
        log_message(f"Das Verzeichnis {output_dir} existiert nicht.", level='warning')

    log_message('Löschen aller generierten Dateien abgeschlossen.')

# Logging initialisieren
setup_logging('clean_logs', 'clean.log')

# Funktion aufrufen
clean_generated_files()
