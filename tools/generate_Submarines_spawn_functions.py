import os

# Funktion zum Laden der Dateien als Text
def load_file_as_text(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Funktion zum Speichern der Dateien als Text
def save_file(content, file_path):
    with open(file_path, 'w') as file:
        file.write(content)

# Liste der 16 Minecraft-Farben
colors = ['black', 'blue', 'brown', 'cyan', 'gray', 'green', 'light_blue', 'light_gray', 'lime', 'magenta', 'orange', 'pink', 'purple', 'red', 'white', 'yellow']

# Pfade für die Input-Dateien und den Ausgabe-Ordner
input_files = [
    'templates/functions/spawn/spawn_1.21.1.mcfunction', 
    'templates/functions/spawn/spawn_1.21.2.mcfunction', 
    'templates/functions/spawn/test/spawn_test.mcfunction'
]

output_dirs = [
    'submarine/function/spawn/1.21.1', 
    'submarine/function/spawn/1.21.2', 
    'submarine/function/spawn/test'
]

# Verzeichnis erstellen, falls nicht vorhanden
for output_dir in output_dirs:
    os.makedirs(output_dir, exist_ok=True)

# Startwert für custom_model_data
custom_model_data_start = 1

# Für jede Input-Datei und jede Farbe eine Datei erstellen
for input_file in input_files:
    # Lade die Datei als Text
    template = load_file_as_text(input_file)

    for index, color in enumerate(colors):
        # Berechne den custom_model_data Wert
        custom_model_data = custom_model_data_start + (index * 4)

        # Ersetze die Platzhalter in der Template ohne Anführungszeichen
        colored_content = template.replace('$color', color).replace('"$custom_model_data"', str(custom_model_data))

        # Erstelle den Ausgabedateinamen basierend auf der Input-Datei
        if '1.21.1' in input_file:
            output_dir = output_dirs[0]
        elif '1.21.2' in input_file:
            output_dir = output_dirs[1]
        elif 'spawn_test' in input_file:
            output_dir = output_dirs[2]

        # Dateiname basierend auf dem Typ der Datei
        if 'spawn_test' in input_file:
            output_file = os.path.join(output_dir, f'spawn_test_{color}_submarine.mcfunction')
        else:
            output_file = os.path.join(output_dir, f'spawn_{color}_submarine.mcfunction')
        
        # Speichere die modifizierte Datei
        save_file(colored_content, output_file)

print(f'Successfully created {len(colors) * len(input_files)} function files in all directories.')
