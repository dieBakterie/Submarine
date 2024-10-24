tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8,limit=1] at @s run give @n[type=player,distance=..2] turtle_spawn_egg[custom_name='"Spawn lime Submarine"',lore=['{"bold":false,"color":"#55FF55","italic":false,"obfuscated":false,"strikethrough":false,"text":"A lime submarine that can be used to explore the depths of the ocean.","underlined":false}'],item_model="submarine:submarines/lime/lime_submarine_1",entity_data={id:marker,NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_lime"],CustomName:'{"bold":false,"color":"#55FF55","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn lime Submarine","underlined":false}'}] 1
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn lime Submarine",tag=color_lime] remove nosubclose
kill @e[name="Spawn lime Submarine",tag=color_lime,tag=!nosubclose]
execute as @s[name="Spawn lime Submarine",tag=color_lime,tag=nosubclose] at @s run function submarine:spawn/spawn_lime_submarine

