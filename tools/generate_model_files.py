import os

from minecraft_utils import (
    load_template,
    save_file,
    count_files_in_directory,
    create_path,
    get_base_dirs,
    COLORS    
)

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
        
    print(f"Erfolgreich {total_files} json-Dateien in {output_dir} erstellt.")

create_model_files()