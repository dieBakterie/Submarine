import os

# Funktion zum Laden der Dateien als Text
def load_template(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Funktion zum Speichern der Dateien als Text
def save_file(content, file_path):
    with open(file_path, 'w') as file:
        file.write(content)

# Liste der 16 Minecraft-Farben und deren entsprechende Hex-Codes
colors_with_hex = {
    'black': '#000000',
    'blue': '#0000AA',
    'brown': '#AA5500',
    'cyan': '#00AAAA',
    'gray': '#AAAAAA',
    'green': '#00AA00',
    'light_blue': '#55FFFF',
    'light_gray': '#AAAAAA',
    'lime': '#55FF55',
    'magenta': '#FF55FF',
    'orange': '#FFAA00',
    'pink': '#FFAAFF',
    'purple': '#AA00AA',
    'red': '#FF5555',
    'white': '#FFFFFF',
    'yellow': '#FFFF55'
}

# Pfade für die Input- und Output-Verzeichnisse
input_dirs = ['templates/functions/spawn/1.21.1', 'templates/functions/spawn/1.21.2', 'templates/functions/spawn/test']
output_dirs = ['submarine/function/spawn/1.21.1', 'submarine/function/spawn/1.21.2', 'submarine/function/spawn/test']

# Namen der Vorlagen-Dateien
template_files = ['spawn_1.21.1.mcfunction', 'spawn_1.21.2.mcfunction', 'spawn_test.mcfunction']

# Verzeichnis erstellen, falls nicht vorhanden
for output_dir in output_dirs:
    os.makedirs(output_dir, exist_ok=True)

# Startwert für custom_model_data
custom_model_data_start = 1

# Für jede Input-Datei und jede Farbe eine Datei erstellen
for input_dir, template_file, output_dir in zip(input_dirs, template_files, output_dirs):
    # Lade die Template-Datei als Text
    template_content = load_template(os.path.join(input_dir, template_file))

    # Startwert für custom_model_data
    custom_model_data_start = 1

    # Für jede Farbe die JSON-Datei erstellen
    for index, (color, hex_code) in enumerate(colors_with_hex.items()):
        # Berechne den custom_model_data Wert
        custom_model_data = custom_model_data_start + (index * 4)

        # Ersetze die Platzhalter in der Vorlage
        colored_template = template_content.replace('$hex_code', hex_code).replace('$color', color)

        # Ersetze den $custom_model_data Platzhalter im Text
        colored_template = colored_template.replace('$custom_model_data', str(custom_model_data))

        # Dateiname basierend auf dem Typ der Datei
        if 'spawn_test' in template_file:
            output_file = os.path.join(output_dir, f'spawn_test_{color}_submarine.mcfunction')
        else:
            output_file = os.path.join(output_dir, f'spawn_{color}_submarine.mcfunction')

        # Speichere die modifizierte Datei
        save_file(colored_template, output_file)

print(f'Successfully created {len(colors_with_hex) * len(template_files)} function files in all directories.')
