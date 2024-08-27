import os

# Funktion zum Laden der Vorlagen-Dateien als Text
def load_template(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Funktion zum Speichern der JSON-Dateien als Text
def save_template(content, file_path):
    with open(file_path, 'w') as file:
        file.write(content)

# Liste der 16 Minecraft-Farben mit entsprechenden Hex-Codes
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
input_dirs = ['templates/recipes/1.21.1', 'templates/recipes/1.21.2']
output_dirs = ['submarine/recipe/1.21.1', 'submarine/recipe/1.21.2']

# Namen der Vorlagen-Dateien
template_files = ['submarine_recipe_template_1.21.1.json', 'submarine_recipe_template_1.21.2.json']

# Verzeichnisse erstellen, falls nicht vorhanden
for output_dir in output_dirs:
    os.makedirs(output_dir, exist_ok=True)

# Für jedes Template und jeden Output-Ordner sowie jede Farbe die entsprechenden Rezepte generieren
for input_dir, template_file, output_dir in zip(input_dirs, template_files, output_dirs):
    # Lade die submarine_recipe_template.json Datei als Text
    template_content = load_template(os.path.join(input_dir, template_file))

    # Startwert für custom_model_data
    custom_model_data_start = 1

    # Für jede Farbe die JSON-Datei erstellen
    for index, (color, hex_code) in enumerate(colors_with_hex.items()):
        # Berechne den custom_model_data Wert
        custom_model_data = custom_model_data_start + (index * 4)

        # Ersetze die Platzhalter in der Vorlage
        colored_template = template_content.replace('$hex_code', hex_code).replace('$color', color).replace('$color_dye', f'{color}_dye')

        # Ersetze den $custom_model_data Platzhalter im Text
        colored_template = colored_template.replace('$custom_model_data', str(custom_model_data))

        # Datei speichern
        output_file = os.path.join(output_dir, f'{color}_submarine.json')
        save_template(colored_template, output_file)

print('Successfully created recipe files for both versions in their respective directories.')
