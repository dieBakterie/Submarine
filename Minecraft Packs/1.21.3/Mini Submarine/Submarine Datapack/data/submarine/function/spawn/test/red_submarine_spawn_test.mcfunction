tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8,limit=1] at @s run give @n[type=player,distance=..10] turtle_spawn_egg[custom_name='"Spawn red Submarine"',lore=['{"bold":false,"color":"#FF5555","italic":false,"obfuscated":false,"strikethrough":false,"text":"A red submarine that can be used to explore the depths of the ocean.","underlined":false}'],custom_model_data=53,entity_data={id:"minecraft:marker",NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_red"],CustomName:'{"bold":false,"color":"#FF5555","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn red Submarine","underlined":false}'}] 1
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn red Submarine",tag=color_red] remove nosubclose
kill @e[name="Spawn red Submarine",tag=color_red,tag=!nosubclose]
execute as @s[name="Spawn red Submarine",tag=color_red,tag=nosubclose] at @s run function submarine:spawn/spawn_red_submarine

