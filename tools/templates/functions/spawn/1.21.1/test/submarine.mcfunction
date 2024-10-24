tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8,limit=1] at @s run give @n[type=player,distance=..10] turtle_spawn_egg[custom_name='"Spawn {color} Submarine"',lore=['{"bold":false,"color":"hex_code","italic":false,"obfuscated":false,"strikethrough":false,"text":"A {color} submarine that can be used to explore the depths of the ocean.","underlined":false}'],custom_model_data=animation_step,entity_data={id:"minecraft:marker",NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_{color}"],CustomName:'{"bold":false,"color":"hex_code","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn {color} Submarine","underlined":false}'}] 1
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn {color} Submarine",tag=color_{color}] remove nosubclose
kill @e[name="Spawn {color} Submarine",tag=color_{color},tag=!nosubclose]
execute as @s[name="Spawn {color} Submarine",tag=color_{color},tag=nosubclose] at @s run function submarine:spawn/spawn_{color}_submarine

