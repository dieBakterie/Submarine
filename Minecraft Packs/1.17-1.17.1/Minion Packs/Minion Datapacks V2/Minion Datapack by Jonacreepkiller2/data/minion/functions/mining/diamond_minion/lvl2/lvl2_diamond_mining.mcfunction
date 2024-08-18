execute as @e[tag=diamond_selected] positioned as @e[scores={dia_ore_counter=24},tag=lvl2] run loot insert ^1 ^ ^ loot minecraft:blocks/diamond_ore
execute as @e[scores={dia_gen_delay=300,dia_ore_counter=24},tag=lvl2] at @s positioned as @e[tag=diamond_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=diamond_selected] at @e[scores={dia_gen_delay=300,dia_ore_counter=24},tag=lvl2] run tag @s[distance=..3] remove diamond_selected
execute as @e[scores={dia_gen_delay=300,dia_ore_counter=24},tag=lvl2] run scoreboard players remove @s dia_ore_counter 2