tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8,limit=1] at @s run give @n[type=player,distance=..2] turtle_spawn_egg[custom_name='"Spawn black Submarine"',lore=['{"bold":false,"color":"#000000","italic":false,"obfuscated":false,"strikethrough":false,"text":"A black submarine that can be used to explore the depths of the ocean.","underlined":false}'],item_model="submarine:submarines/black/black_submarine_1",entity_data={id:marker,NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_black"],CustomName:'{"bold":false,"color":"#000000","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn black Submarine","underlined":false}'}] 1
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn black Submarine",tag=color_black] remove nosubclose
kill @e[name="Spawn black Submarine",tag=color_black,tag=!nosubclose]
execute as @s[name="Spawn black Submarine",tag=color_black,tag=nosubclose] at @s run function submarine:spawn/spawn_black_submarine

