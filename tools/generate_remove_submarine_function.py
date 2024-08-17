import os

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

# Pfad für die Ausgabe-Datei
output_dir = 'submarine/functions/remove'
os.makedirs(output_dir, exist_ok=True)
output_file = os.path.join(output_dir, 'remove_submarines.mcfunction')

# Startwert für custom_model_data
custom_model_data_start = 1

# Datei erstellen und öffnen
with open(output_file, 'w') as file:
    # Für jede Farbe den Befehl hinzufügen
    for index, (color, hex_code) in enumerate(colors_with_hex.items()):
        custom_model_data = custom_model_data_start + (index * 4)
        command = (
            f'execute as @s[tag=color_{color}] at @s run give @p[limit=1,sort=nearest,distance=..1,tag=submariner] '
            f'turtle_spawn_egg[custom_name=\'{{"bold":false,"color":"{hex_code}","italic":false,"obfuscated":false,'
            f'"strikethrough":false,"text":"Spawn {color} Submarine","underlined":false}}\','
            f'lore=[\'{{"bold":false,"color":"{hex_code}","italic":false,"obfuscated":false,"strikethrough":false,'
            f'"text":"Use it on water to spawn your {color} Submarine!","underlined":false}}\'],hide_additional_tooltip={{}},'
            f'custom_model_data={custom_model_data},entity_data={{id:"minecraft:marker",OnGround:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,'
            f'Tags:["color_{color}"],CustomName:\'{{"bold":false,"color":"{hex_code}","italic":false,'
            f'"obfuscated":false,"strikethrough":false,"text":"Spawn Submarine","underlined":false}}\'}}] 1\n'
        )
        file.write(command)

    # Zwei Leerzeilen am Ende hinzufügen
    file.write('\n')

print(f'Successfully created the mcfunction file {output_file}.')
