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

def create_recipe_files():
    print("Erstelle Rezept-Dateien...")
    base_dirs = get_base_dirs()
    
    # Hole die versionierten Verzeichnisse für die Rezepte
    output_dirs = get_versioned_dirs(base_dirs['recipes_output'], '')
    input_dirs = get_versioned_dirs(base_dirs['recipes_input'], '')
    
    custom_model_data_start = 1  # Starte bei 1 für die erste Farbe
    
    # Schleife über jede Farbe, mit Index zur Berechnung von Custom Model Data
    for index, (color, hex_code) in enumerate(COLORS.items()):
        # Berechne den Custom Model Data Wert für die aktuelle Farbe
        custom_model_data = custom_model_data_start + (index * 4)
        
        # Schleife über jede Version
        for version, output_dir in output_dirs.items():
            # Erstelle den Ausgabeordner, falls er nicht existiert
            os.makedirs(output_dir, exist_ok=True)
            
            # Lade die versionsspezifische Vorlage für die Rezept-Datei
            file_content = load_template(create_path(input_dirs[version], f'submarine_recipe_template_{version}.json'))
            
            # Erstelle die Rezept-Datei für die jeweilige Farbe und Version
            output_file_path = create_path(output_dir, f'{color}_submarine.json')
            print(f'Erstelle {output_file_path}...')
            
            # Ersetze die Platzhalter in der Vorlage mit Attributen
            file_content = file_content.replace('{color}', color).replace('{hex_code}', hex_code)
            
            if version <= '1.21.1':
                # Ersetze die Platzhalter für Custom Model Data
                for i in range(1, 5):  # Immer 4 Schritte
                    animation_step = custom_model_data + (i - 1)
                    file_content = file_content.replace('animation_step', str(animation_step), 1)
                    
                # Erstelle die Rezept-Datei
                save_file(file_content, output_file_path)  # Verwende die save_file Funktion
                
            else:
                # Erstelle die Rezept-Datei
                save_file(file_content, output_file_path)  # Verwende die save_file Funktion
                
    # Ausgabe der Ergebnisse
    print("\nCreating Recipe Directories:")
    for version, path in output_dirs.items():
        print(f'{version} Directory: {path}')
        
    print("\nFile Count per Recipe Directory:")
    for version, path in output_dirs.items():
        file_count = count_files_in_directory(path)
        print(f'{version}: {file_count} files')
        
    total_files = sum(count_files_in_directory(path) for path in output_dirs.values())
    print(f'Erfolgreich {total_files} json-Dateien erstellt und gespeichert in allen Verzeichnissen.')

create_recipe_files()