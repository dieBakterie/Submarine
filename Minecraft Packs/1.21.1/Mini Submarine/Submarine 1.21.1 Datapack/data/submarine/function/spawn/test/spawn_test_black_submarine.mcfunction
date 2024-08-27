tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8,limit=1] at @s run give @n[type=player,distance=..10] turtle_spawn_egg[custom_name='{"bold":false,"color":"#000000","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn black Submarine","underlined":false}',lore=['{"bold":false,"color":"#000000","italic":false,"obfuscated":false,"strikethrough":false,"text":"A submarine that can be used to explore the depths of the ocean.","underlined":false}'],custom_model_data=1,entity_data={id:"minecraft:marker",NoGravity:1b,CustomName:'{"bold":false,"color":"#000000","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn Submarine","underlined":false}',Silent:1b,Invulnerable:1b,Tags:["color_black"]}] 1
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn Submarine",tag=color_black] remove nosubclose
kill @e[name="Spawn Submarine",tag=color_black,tag=!nosubclose]
execute as @s[name="Spawn Submarine",tag=color_black,tag=nosubclose] at @s run function submarine:spawn/spawn_black_submarine

