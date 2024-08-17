execute as @e[tag=coal_selected] positioned as @e[scores={coal_ore_counter=24},tag=lvl4] run loot insert ^1 ^ ^ loot minecraft:blocks/coal_ore
execute as @e[scores={coal_gen_delay=140,coal_ore_counter=24},tag=lvl4] at @s positioned as @e[tag=coal_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=coal_selected] at @e[scores={coal_gen_delay=140,coal_ore_counter=24},tag=lvl4] run tag @s[distance=..3] remove coal_selected
execute as @e[scores={coal_gen_delay=140,coal_ore_counter=24},tag=lvl4] run scoreboard players remove @s coal_ore_counter 2