execute as @s[tag=color_black] at @s run give @n[type=player,tag=submariner] turtle_spawn_egg[custom_name='{"bold":false,"color":"#000000","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn black Submarine","underlined":false}',lore=['{"bold":false,"color":"#000000","italic":false,"obfuscated":false,"strikethrough":false,"text":"A black submarine that can be used to explore the depths of the ocean.","underlined":false}'],hide_additional_tooltip={},custom_model_data=1,entity_data={id:"minecraft:marker",OnGround:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_black"],CustomName:'{"bold":false,"color":"#000000","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn black Submarine","underlined":false}'}] 1
execute as @s[name="Remove black Submarine"] at @s run kill @n[tag=sub2,limit=4]
execute as @s[name="Remove black Submarine"] at @s run kill @s

