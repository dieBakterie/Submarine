import os

# Funktion zum Laden der Dateien als Text
def lade_datei(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Funktion zum Speichern der Dateien als Text
def speichere_datei(content, file_path):
    with open(file_path, 'w') as file:
        file.write(content)

# Liste der 16 Minecraft-Farben
farben = [
    "black", "blue", "brown", "cyan", "gray", 
    "green", "light_blue", "light_gray", "lime", "magenta", 
    "orange", "pink", "purple", "red", "white", "yellow"
]

# Pfade für die Input-Dateien und den Ausgabe-Ordner
input_files = [
    "templates/functions/spawn/spawn.mcfunction",
    "templates/functions/spawn/spawn_test.mcfunction"
]
ausgabe_ordner = "submarine/functions/spawn"

# Verzeichnis erstellen, falls nicht vorhanden
os.makedirs(ausgabe_ordner, exist_ok=True)

# Startwert für custom_model_data
custom_model_data_start = 1

# Für jede Input-Datei und jede Farbe eine Datei erstellen
for input_file in input_files:
    # Lade die Datei als Text
    vorlage = lade_datei(input_file)

    for index, farbe in enumerate(farben):
        # Berechne den custom_model_data Wert
        custom_model_data = custom_model_data_start + (index * 4)

        # Ersetze die Platzhalter in der Vorlage ohne Anführungszeichen
        farbige_vorlage = vorlage.replace("$color", farbe).replace('"$custom_model_data"', str(custom_model_data))

        # Erstelle den Ausgabedateinamen basierend auf der Input-Datei
        if "spawn_test" in input_file:
            output_file = os.path.join(ausgabe_ordner, f"spawn_{farbe}_test.mcfunction")
        else:
            output_file = os.path.join(ausgabe_ordner, f"spawn_{farbe}.mcfunction")
        
        # Speichere die modifizierte Datei
        speichere_datei(farbige_vorlage, output_file)

print(f"Successfully created {len(farben) * len(input_files)} function files in the '{ausgabe_ordner}' directory.")
