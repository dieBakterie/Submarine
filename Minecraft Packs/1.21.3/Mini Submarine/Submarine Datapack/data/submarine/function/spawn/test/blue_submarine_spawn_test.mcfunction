tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8,limit=1] at @s run give @n[type=player,distance=..10] turtle_spawn_egg[custom_name='"Spawn blue Submarine"',lore=['{"bold":false,"color":"#0000AA","italic":false,"obfuscated":false,"strikethrough":false,"text":"A blue submarine that can be used to explore the depths of the ocean.","underlined":false}'],custom_model_data=5,entity_data={id:"minecraft:marker",NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_blue"],CustomName:'{"bold":false,"color":"#0000AA","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn blue Submarine","underlined":false}'}] 1
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn blue Submarine",tag=color_blue] remove nosubclose
kill @e[name="Spawn blue Submarine",tag=color_blue,tag=!nosubclose]
execute as @s[name="Spawn blue Submarine",tag=color_blue,tag=nosubclose] at @s run function submarine:spawn/spawn_blue_submarine

