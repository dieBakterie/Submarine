from minecraft_utils import (
    os,
    load_template,
    save_file,
    get_base_dirs,
    get_versioned_dirs,
    count_files_in_directory,
    create_path,
    COLORS
)

def create_spawn_files():
    print("Erstelle Spawn-Dateien...")
    base_dirs = get_base_dirs()
    
    # Hole die versionierten Verzeichnisse für die Spawn-Dateien
    output_dirs = get_versioned_dirs(base_dirs['spawn_output'], '')
    input_dirs = get_versioned_dirs(base_dirs['spawn_input'], '')
    
    custom_model_data_start = 1  # Starte bei 1 für die erste Farbe
    
    # Schleife über jede Farbe mit Index zur Berechnung von Custom Model Data
    for index, (color, hex_code) in enumerate(COLORS.items()):
        # Berechne den Custom Model Data Wert für die aktuelle Farbe
        custom_model_data = custom_model_data_start + (index * 4)
        
        # Schleife über jede Version
        for version, output_dir in output_dirs.items():
            
            # Erstelle den Ausgabeordner, falls er nicht existiert
            os.makedirs(output_dir, exist_ok=True)
            
            # Erstelle Unterverzeichnis 'with_attributes' falls nötig
            output_dir_with_attributes = create_path(output_dir, 'with_attributes')
            os.makedirs(output_dir_with_attributes, exist_ok=True)
            
            # Lade die versionsspezifischen Spawn-Vorlagen
            version_template_path = create_path(input_dirs[version], f'spawn_{version}.mcfunction')
            version_template_path_with_attributes = create_path(input_dirs[version], f'spawn_{version}_with_attributes.mcfunction')
            
            # Normale Spawn-Datei verarbeiten
            if os.path.exists(version_template_path):
                output_file_path = create_path(output_dir, f'spawn_{color}_submarine.mcfunction')
                version_template_content = load_template(version_template_path)
                
                # Ersetze die Platzhalter in der versionsspezifischen Vorlage
                file_content = version_template_content.replace('{color}', color)
                
                # Ersetze die Platzhalter für Custom Model Data
                for i in range(1, 5):  # Immer 4 Schritte
                    animation_step = custom_model_data + (i - 1)
                    file_content = file_content.replace('animation_step', str(animation_step), 1)
                    
                # Verwende save_file, um die Datei zu speichern
                save_file(file_content, output_file_path)
                
            # Datei mit Attributen verarbeiten
            if os.path.exists(version_template_path_with_attributes):
                output_file_path_with_attributes = create_path(output_dir_with_attributes, f'spawn_{color}_submarine_with_attributes.mcfunction')
                version_template_content_with_attributes = load_template(version_template_path_with_attributes)
                
                # Ersetze die Platzhalter in der Vorlage mit Attributen
                file_content = version_template_content_with_attributes.replace('{color}', color)
                
                # Ersetze die Platzhalter für Custom Model Data
                for i in range(1, 5):  # Immer 4 Schritte
                    animation_step = custom_model_data + (i - 1)
                    file_content = file_content.replace('animation_step', str(animation_step), 1)
                    
                # Verwende save_file, um die Datei mit Attributen zu speichern
                save_file(file_content, output_file_path_with_attributes)
                
            # Lade die versionsspezifischen Spawn-Test-Vorlagen
            test_template_path = create_path(input_dirs[version], 'test', f'spawn_{version}_test.mcfunction')
            if os.path.exists(test_template_path):
                test_output_dir = create_path(output_dir, 'test')
                os.makedirs(test_output_dir, exist_ok=True)
                
                test_template_content = load_template(test_template_path)
                
                # Ersetze die Platzhalter in der versionsspezifischen Test Vorlage
                file_content = test_template_content.replace('{color}', color).replace('{hex_code}', hex_code)
                
                # Ersetze die Platzhalter für Custom Model Data
                for i in range(1, 5):  # Immer 4 Schritte
                    animation_step = custom_model_data + (i - 1)
                    file_content = file_content.replace('animation_step', str(animation_step), 1)
                    
                # Verwende save_file, um die Test-Datei zu speichern
                output_test_file_path = create_path(test_output_dir, f'spawn_test_{color}_submarine.mcfunction')
                save_file(file_content, output_test_file_path)
                
    # Ausgabe der Ergebnisse
    print("\nCreating Spawn Directories:")
    for version, path in output_dirs.items():
        print(f'{version} Directory: {path}')
        
    print("\nFile Count per Spawn Directory:")
    for version, path in output_dirs.items():
        file_count = count_files_in_directory(path)
        print(f'{version}: {file_count} files')
        
    total_files = sum(count_files_in_directory(path) for path in output_dirs.values())
    print(f'Erfolgreich {total_files} mcfunction-Dateien erstellt und gespeichert in allen Verzeichnissen.')

create_spawn_files()