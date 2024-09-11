tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8,limit=1] at @s run give @n[type=player,distance=..2] turtle_spawn_egg[custom_name='"Spawn orange Submarine"',lore=['{"bold":false,"color":"#FFAA00","italic":false,"obfuscated":false,"strikethrough":false,"text":"A orange submarine that can be used to explore the depths of the ocean.","underlined":false}'],item_model="submarine:submarines/orange/orange_submarine_1",entity_data={id:marker,NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_orange"],CustomName:'{"bold":false,"color":"#FFAA00","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn orange Submarine","underlined":false}'}] 1
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn orange Submarine",tag=color_orange] remove nosubclose
kill @e[name="Spawn orange Submarine",tag=color_orange,tag=!nosubclose]
execute as @s[name="Spawn orange Submarine",tag=color_orange,tag=nosubclose] at @s run function submarine:spawn/spawn_orange_submarine

