execute as @s[tag=color_brown] at @s run give @n[type=player,tag=submariner] turtle_spawn_egg[custom_name='{"bold":false,"color":"#AA5500","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn brown Submarine","underlined":false}',lore=['{"bold":false,"color":"#AA5500","italic":false,"obfuscated":false,"strikethrough":false,"text":"A brown submarine that can be used to explore the depths of the ocean.","underlined":false}'],hide_additional_tooltip={},item_model="submarine:submarines/brown/brown_submarine_1",entity_data={id:marker,OnGround:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["color_brown"],CustomName:'{"bold":false,"color":"#AA5500","italic":false,"obfuscated":false,"strikethrough":false,"text":"Spawn brown Submarine","underlined":false}'}] 1
execute as @s[name="Remove brown Submarine"] at @s run kill @n[tag=sub2,limit=4]
execute as @s[name="Remove brown Submarine"] at @s run kill @s

