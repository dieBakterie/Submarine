tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8,limit=1] at @s run give @n[type=player,distance=..10] turtle_spawn_egg[custom_name='{"bold":false,"color":"#FF55FF","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn magenta Submarine","underlined":false}',lore=['{"bold":false,"color":"#FF55FF","italic":false,"obfuscated":false,"strikethrough":false,"text":"A submarine that can be used to explore the depths of the ocean.","underlined":false}'],custom_model_data=37,entity_data={id:"minecraft:marker",NoGravity:1b,CustomName:'{"bold":false,"color":"#FF55FF","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn Submarine","underlined":false}',Silent:1b,Invulnerable:1b,Tags:["color_magenta"]}] 1
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn Submarine",tag=color_magenta] remove nosubclose
kill @e[name="Spawn Submarine",tag=color_magenta,tag=!nosubclose]
execute as @s[name="Spawn Submarine",tag=color_magenta,tag=nosubclose] at @s run function submarine:spawn/spawn_magenta_submarine

