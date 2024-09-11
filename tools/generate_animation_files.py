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

def create_animation_files():
    print("Erstelle Animations-Dateien...")
    base_dirs = get_base_dirs()
    
    # Hole die versionierten Verzeichnisse für die Animationen
    output_dirs = get_versioned_dirs(base_dirs['animations_output'], '')
    input_dirs = get_versioned_dirs(base_dirs['animations_input'], '')
    global_template_path = create_path(base_dirs['animations_input'], 'animation_template.mcfunction')
    
    custom_model_data_start = 1  # Starte bei 1 für die erste Farbe
    
    # Schleife über jede Version
    for version, output_dir in output_dirs.items():
        # Erstelle das Ausgabe-Verzeichnis, falls es nicht existiert
        os.makedirs(output_dir, exist_ok=True)
        
        # Erstelle die globale Animationsdatei (1 Datei pro Version)
        file_path_global = create_path(output_dir, f'submarine_animation.mcfunction')
        print(f'Erstelle {file_path_global}...')
        
        # Lade und speichere die globale Animationsvorlage
        global_template_content = load_template(global_template_path)
        save_file(global_template_content, file_path_global)
        
    # Jetzt die farbspezifischen Dateien erstellen
    for index, (color, hex_code) in enumerate(COLORS.items()):
        # Berechne den Custom Model Data Wert für die aktuelle Farbe
        custom_model_data = custom_model_data_start + (index * 4)
        
        # Schleife über jede Version
        for version, output_dir in output_dirs.items():
            # Erstelle den Ausgabeordner, falls er nicht existiert
            os.makedirs(output_dir, exist_ok=True)
            
            # Lade die versionsspezifischen Vorlagen
            file_content = load_template(create_path(input_dirs[version], f'animation_template_{version}.mcfunction'))
            
            # Erstelle die Animationsdatei für die jeweilige Farbe und Version
            output_file_path = create_path(output_dir, f'{color}_submarine_animation.mcfunction')
            print(f'Erstelle {output_file_path}...')
            
            # Ersetze die Platzhalter in der versionsspezifischen Vorlage
            file_content = file_content.replace('{color}', color).replace('{hex_code}', hex_code)
            
            if version <= '1.21.1':
                # Ersetze die Platzhalter für vorwärtsgerichtete Animation (1 bis 4)
                for i in range(1, 5):  # Immer 4 Schritte
                    animation_step = custom_model_data + (i - 1)
                    file_content = file_content.replace('animation_step', str(animation_step), 1)
                
                # Ersetze die Platzhalter für rückwärtsgerichtete Animation (4 bis 1)
                for i in range(1, 5):
                    animation_step = custom_model_data + (4 - i)
                    file_content = file_content.replace('animation_step', str(animation_step), 1)
                
                # Speichere die finale Datei
                save_file(file_content, output_file_path)
                
            else:
                # Speichere die finale Datei
                save_file(file_content, output_file_path)
            
    # Ausgabe der Ergebnisse
    print("\nCreating Animation Directories:")
    for version, path in output_dirs.items():
        print(f'{version} Directory: {path}')
        
    print("\nFile Count per Animation Directory:")
    for version, path in output_dirs.items():
        file_count = count_files_in_directory(path)
        print(f'{version}: {file_count} files')
        
    total_files = sum(count_files_in_directory(path) for path in output_dirs.values())
    print(f'Erfolgreich {total_files} mcfunction-Dateien erstellt und gespeichert in allen Verzeichnissen.')

create_animation_files()