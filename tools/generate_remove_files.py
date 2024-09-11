from minecraft_utils import (
    os,
    get_base_dirs,
    get_versioned_dirs,
    create_path,
    COLORS
)

# Pfad für die Ausgabe-Datei
base_dirs = get_base_dirs()

output_dir = create_path(base_dirs['removes_output'], '')
os.makedirs(output_dir, exist_ok=True)
output_file = create_path(output_dir, 'remove_submarines.mcfunction')

# Startwert für custom_model_data
custom_model_data_start = 1

# Datei erstellen und öffnen
with open(output_file, 'w') as file:
    # Für jede Farbe den Befehl hinzufügen
    for index, (color, hex_code) in enumerate(COLORS.items()):
        custom_model_data = custom_model_data_start + (index * 4)
        command = (
            f'execute as @s[tag=color_{color}] at @s run give @n[type=player,tag=submariner] '
            f'turtle_spawn_egg[custom_name=\'{{"bold":false,"color":"{hex_code}","italic":false,"obfuscated":false,'
            f'"strikethrough":false,"text":"Spawn {color} Submarine","underlined":false}}\','
            f'lore=[\'{{"bold":false,"color":"{hex_code}","italic":false,"obfuscated":false,"strikethrough":false,'
            f'"text":"A {color} submarine that can be used to explore the depths of the ocean.","underlined":false}}\'],hide_additional_tooltip={{}},'
            f'item_model="submarine:submarines/{color}/{color}_submarine_1",entity_data={{id:"minecraft:marker",OnGround:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,'
            f'Tags:["color_{color}"],CustomName:\'{{"bold":false,"color":"{hex_code}","italic":false,'
            f'"obfuscated":false,"strikethrough":false,"text":"Spawn {color} Submarine","underlined":false}}\'}}] 1\n'
        )
        file.write(command)

    # Zweite Leerzeile am Ende hinzufügen
    file.write('\n')

print(f"Erfolgreich die {output_file} Datei erstellt und gespeichert im {output_dir} Verzeichnis.")
