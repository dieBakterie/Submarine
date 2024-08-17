import os

# Funktion zum Laden der JSON-Dateien als Text
def load_json_as_text(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Funktion zum Speichern der JSON-Dateien als Text
def save_json_as_text(content, file_path):
    with open(file_path, 'w') as file:
        file.write(content)

# Liste der Farben (Beispielhaft für 16 Farben)
colors = ['black', 'blue', 'brown', 'cyan', 'gray', 'green', 'light_blue', 'light_gray', 'lime', 'magenta', 'orange', 'pink', 'purple', 'red', 'white', 'yellow']

# Ordnerpfade
input_dir = 'templates/models'
output_dir = 'submarine/models/sumbarines/{color}'

# Dateien einlesen
model_files = ['submarine_model_template_1.json', 'submarine_model_templatesubmarine_2.json', 'submarine_model_template_submarine_3.json', 'submarine_model_template_submarine_4.json']

# Erstellen des Ausgabeordners, falls er nicht existiert
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

for model_file in model_files:
    for color in colors:
        index = model_file.split('_')[3].split('.')[0]
        content = load_json_as_text(os.path.join(input_dir, model_file))

        # Textstellen anpassen
        modified_content = content.replace('block/quartz_block_top', f'block/{color}_concrete')
        
        # Speichern der modifizierten Datei mit dem gewünschten Dateinamen
        output_file = f'{color}_submarine_{index}.json'
        save_json_as_text(modified_content, os.path.join(output_dir, output_file))

print('Die Dateien wurden erfolgreich generiert und im Ordner {output_dir} gespeichert.')