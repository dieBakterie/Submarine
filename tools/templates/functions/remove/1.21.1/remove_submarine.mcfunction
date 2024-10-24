execute as @s[tag=color_{color}] at @s run give @n[type=player,tag=submariner] turtle_spawn_egg[custom_name='{"bold":false,"color":"hex_code","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn {color} Submarine","underlined":false}',lore=['{"bold":false,"color":"hex_code","italic":false,"obfuscated":false,"strikethrough":false,"text":"A {color} submarine that can be used to explore the depths of the ocean.","underlined":false}'],hide_additional_tooltip={},custom_model_data=animation_step,entity_data={id:"minecraft:marker",OnGround:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_{color}"],CustomName:'{"bold":false,"color":"hex_code","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn {color} Submarine","underlined":false}'}] 1
execute as @s[name="Remove {color} Submarine"] at @s run kill @n[tag=sub2,limit=4]
execute as @s[name="Remove {color} Submarine"] at @s run kill @s

