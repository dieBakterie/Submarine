import os

# Liste der 16 Minecraft-Farben
colors = [
    "black", "blue", "brown", "cyan", "gray", 
    "green", "light_blue", "light_gray", "lime", "magenta", 
    "orange", "pink", "purple", "red", "white", "yellow"
]

# Verzeichnis erstellen, falls nicht vorhanden
output_dir = "submarine/animation_functions"
os.makedirs(output_dir, exist_ok=True)

# Anzahl der Animationen
animations = 4

# Loop durch jede Farbe
custom_model_data_start = 1
for color in colors:
    # Dateiname für die Animation definieren
    file_path = os.path.join(output_dir, f"submarine_{color}_animation.mcfunction")

    # Datei erstellen und öffnen
    with open(file_path, 'w') as file:
        # Füge den initialen Scoreboard-Befehl hinzu
        file.write("scoreboard players add @s animation 1\n")

        # Forward-Animation Schleife
        for i in range(1, animations + 1):
            # Berechne den richtigen custom_model_data Wert für die Vorwärtsanimation
            animation_step = custom_model_data_start + ((i - 1) % 4)
            command_forward = (f"execute as @s[tag=subforward,tag=color_{color},scores={{animation={i}}}] "
                               f"run data merge entity @s {{ArmorItems:[{{}},{{}},{{}},{{id:\"minecraft:diamond_hoe\",count:1,components:{{custom_model_data:{animation_step}}}}}]}}\n")
            file.write(command_forward)

        # Backward-Animation Schleife
        for i in range(1, animations + 1):
            # Berechne den richtigen custom_model_data Wert für die Rückwärtsanimation
            animation_step = custom_model_data_start + ((animations - i) % 4)
            command_backwards = (f"execute as @s[tag=subbackwards,tag=color_{color},scores={{animation={i}}}] "
                                 f"run data merge entity @s {{ArmorItems:[{{}},{{}},{{}},{{id:\"minecraft:diamond_hoe\",count:1,components:{{custom_model_data:{animation_step}}}}}]}}\n")
            file.write(command_backwards)

        # Füge den finalen Scoreboard-Reset-Befehl hinzu
        file.write("scoreboard players set @s[scores={animation=5..}] animation 0\n")

        # Füge eine leere Zeile am Ende hinzu
        file.write("\n")

    # Inkrementiere den Startwert für die nächste Farbe
    custom_model_data_start += 4

print(f"Successfully created {len(colors)} animation mcfunction files in the '{output_dir}' directory.")
