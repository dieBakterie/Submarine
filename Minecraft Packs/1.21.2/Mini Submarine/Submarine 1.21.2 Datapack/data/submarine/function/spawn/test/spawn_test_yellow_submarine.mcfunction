tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8,limit=1] at @s run give @n[type=player,distance=..2] turtle_spawn_egg[custom_name='"Spawn yellow Submarine"',lore=['{"bold":false,"color":"#FFFF55","italic":false,"obfuscated":false,"strikethrough":false,"text":"A yellow submarine that can be used to explore the depths of the ocean.","underlined":false}'],item_model="submarine:submarines/yellow/yellow_submarine_1",entity_data={id:marker,NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_yellow"],CustomName:'{"bold":false,"color":"#FFFF55","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn yellow Submarine","underlined":false}'}] 1
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn yellow Submarine",tag=color_yellow] remove nosubclose
kill @e[name="Spawn yellow Submarine",tag=color_yellow,tag=!nosubclose]
execute as @s[name="Spawn yellow Submarine",tag=color_yellow,tag=nosubclose] at @s run function submarine:spawn/spawn_yellow_submarine

