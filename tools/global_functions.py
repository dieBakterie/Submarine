from re import sub
import argparse, subprocess

import os

from minecraft_utils import (
    load_template,
    save_file,
    get_base_dirs,
    get_versioned_dirs,
    debug,
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
            print(output_dir)
            # Erstelle den Ausgabeordner, falls er nicht existiert
            os.makedirs(output_dir, exist_ok=True)
            
            # Lade die versionsspezifischen Vorlagen
            version_template_path = create_path(input_dirs[version], f'animation_{version}_template.mcfunction')
            version_template_content = load_template(version_template_path)
            
            # Erstelle die Animationsdatei für die jeweilige Farbe und Version
            file_path_version = create_path(output_dir, f'{color}_submarine_animation.mcfunction')
            print(f'Erstelle {file_path_version}...')
            
            # Ersetze die Platzhalter in der versionsspezifischen Vorlage
            file_content = version_template_content.replace('{color}', color)
            
            # Ersetze die Platzhalter für vorwärtsgerichtete Animation (1 bis 4)
            for i in range(1, 5):  # Immer 4 Schritte
                animation_step = custom_model_data + (i - 1)
                file_content = file_content.replace('animation_step', str(animation_step), 1)
                
            # Ersetze die Platzhalter für rückwärtsgerichtete Animation (4 bis 1)
            for i in range(1, 5):
                animation_step = custom_model_data + (4 - i)
                file_content = file_content.replace('animation_step', str(animation_step), 1)
                
            # Speichere die finale Datei
            save_file(file_content, file_path_version)
            
    # Ausgabe der Ergebnisse
    print("\nCreating Animation Directories:")
    for version, path in output_dirs.items():
        print(f'{version} Directory: {path}')
        
    print("\nFile Count per Animation Directory:")
    for version, path in output_dirs.items():
        file_count = count_files_in_directory(path)
        print(f'{version}: {file_count} files')
        
    total_files = sum(count_files_in_directory(path) for path in output_dirs.values())
    print(f'Erfolgreich {total_files} json-Dateien erstellt und gespeichert in allen Verzeichnissen.')

def create_model_files():
    print("Erstelle Modell-Dateien...")
    base_dirs = get_base_dirs()
    input_dir = base_dirs['models_input']
    output_dir = base_dirs['models_output']
    
    model_files = [
        'submarines_model_template_1.json',
        'submarines_model_template_2.json',
        'submarines_model_template_3.json',
        'submarines_model_template_4.json'
    ]
    
    # Schleife über jede Modellvorlage
    for model_file in model_files:
        for color in COLORS.keys():
            # Erstelle das Ausgabe-Verzeichnis für jede Farbe
            color_output_dir = create_path(output_dir, color)
            os.makedirs(color_output_dir, exist_ok=True)
            
            # Lade und bearbeite das Modell-Template
            model_path = create_path(input_dir, model_file)
            index = model_file.split('_')[3].split('.')[0]  # Index aus Dateiname extrahieren
            content = load_template(model_path)
            modified_content = content.replace('block/quartz_block_top', f'block/{color}_concrete')
            
            # Speichere die bearbeitete Datei im Ausgabe-Verzeichnis
            output_file = f'{color}_submarine_{index}.json'
            save_file(modified_content, os.path.join(color_output_dir, output_file))
            
    # Zähle die Dateien in jedem Farbverzeichnis
    color_dirs = {color: create_path(output_dir, color) for color in COLORS.keys()}
    file_count_per_color = {color: count_files_in_directory(dir_path) for color, dir_path in color_dirs.items()}
    total_files = sum(file_count_per_color.values())
    
    # Ausgabe der Verzeichnisstruktur und Dateianzahl
    print("\nCreating Color Directories in Models Output:")
    for color, path in color_dirs.items():
        print(f'{color} Directory: {path}')
        
    print("\nFile Count per Color Directory:")
    for color, count in file_count_per_color.items():
        print(f'{color}: {count} files')
        
    print(f"Erfolgreich {total_files} JSON-Dateien in {output_dir} erstellt.")

def create_recipe_files():
    print("Erstelle Rezept-Dateien...")
    base_dirs = get_base_dirs()
    input_dirs = get_versioned_dirs(base_dirs['recipes_input'], '')
    output_dirs = get_versioned_dirs(base_dirs['recipes_output'], '')
    
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
            
            # Ersetze die Platzhalter in der Vorlage mit Attributen
            file_content = file_content.replace('{color}', color).replace('{hex_code}', hex_code)
            
            # Ersetze die Platzhalter für Custom Model Data
            for i in range(1, 5):  # Immer 4 Schritte
                animation_step = custom_model_data + (i - 1)
                file_content = file_content.replace('animation_step', str(animation_step), 1)
                
            # Erstelle die Rezept-Datei
            output_file_path = create_path(output_dir, f'{color}_submarine.json')
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

def main():
    parser = argparse.ArgumentParser(description='Generiere Minecraft-Dateien.')
    parser.add_argument('-a', '--animations', action='store_true', help='Erstellt die Animations-Dateien')
    parser.add_argument('-m', '--models', action='store_true', help='Erstellt die Modell-Dateien')
    parser.add_argument('-r', '--recipes', action='store_true', help='Erstellt die Rezept-Dateien')
    parser.add_argument('-rm', '--remove', action='store_true', help='Erstellt die Remove-Dateien')
    parser.add_argument('-s', '--spawn', action='store_true', help='Erstellt die Spawn-Dateien')
    parser.add_argument('-d', '--debug', action='store_true', help='Zeigt Debug-Informationen an')
    parser.add_argument('-c', '--clean', action='store_true', help='Löscht alle generierten Dateien')
    parser.add_argument('-v', '--version', action='version', version='1.0', help='Zeigt die Skript-Version an')

    args = parser.parse_args()

    if args.animations:
        #create_animation_files()
        subprocess.run(['python', 'generate_animation_files.py'])
    if args.models:
        #create_model_files()
        subprocess.run(['python', 'generate_model_files.py'])
    if args.recipes:
        #create_recipe_files()
        subprocess.run(['python', 'generate_recipe_files.py'])
    if args.remove:
        #create_remove_files()
        subprocess.run(['python', 'generate_remove_files.py'])
    if args.spawn:
        #create_spawn_files()
        subprocess.run(['python', 'generate_spawn_files.py'])
    if args.debug:
        debug()
    if args.clean:
        print("Lösche generierte Dateien...")
        subprocess.run(['python', 'clean.py'])

    if any([args.animations, args.models, args.recipes, args.spawn, args.debug, args.clean]):
        print("Fertig!")

if __name__ == "__main__":
    main()
