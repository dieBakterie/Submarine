import os

# Funktion zum Laden der JSON-Dateien als Text
def lade_json(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Funktion zum Speichern der JSON-Dateien als Text
def speichere_json(content, file_path):
    with open(file_path, 'w') as file:
        file.write(content)

# Liste der 16 Minecraft-Farben
farben = [
    "black", "blue", "brown", "cyan", "gray", 
    "green", "light_blue", "light_gray", "lime", "magenta", 
    "orange", "pink", "purple", "red", "white", "yellow"
]

# Pfade
vorlage_datei = "templates/recipe/submarine_recipe_template.json"
ausgabe_ordner = "submarine/recipe"

# Verzeichnis erstellen, falls nicht vorhanden
os.makedirs(ausgabe_ordner, exist_ok=True)

# Lade die submarine_recipe_template.json Datei als Text
Vorlage = lade_json(vorlage_datei)

# Startwert für custom_model_data
custom_model_data_start = 1

# Für jede Farbe die JSON-Datei erstellen
for index, farbe in enumerate(farben):
    # Berechne den custom_model_data Wert
    custom_model_data = custom_model_data_start + (index * 4)
    
    # Ersetze die Platzhalter in der Vorlage, wobei der custom_model_data-Wert als Zahl eingefügt wird
    farbige_vorlage = Vorlage.replace("$color", farbe).replace("$color_dye", f"{farbe}_dye")
    
    # Ersetze den $custom_model_data Platzhalter direkt im Text
    farbige_vorlage = farbige_vorlage.replace('"$custom_model_data"', str(custom_model_data))

    # Datei speichern
    output_file = os.path.join(ausgabe_ordner, f"submarine_{farbe}.json")
    speichere_json(farbige_vorlage, output_file)

print(f"Successfully created {len(farben)} recipe files in the '{ausgabe_ordner}' directory.")
