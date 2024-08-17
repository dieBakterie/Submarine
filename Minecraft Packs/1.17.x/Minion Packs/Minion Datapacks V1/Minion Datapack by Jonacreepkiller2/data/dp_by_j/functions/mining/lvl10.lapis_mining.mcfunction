execute as @e[tag=lapis_selected] positioned as @e[scores={lap_ore_counter=24},tag=lvl1010] run loot insert ^1 ^ ^ loot minecraft:blocks/lapis_ore
execute as @e[scores={lapis_gen_delay=360,lap_ore_counter=24},tag=lvl1010] at @s positioned as @e[tag=lapis_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=lapis_selected] at @e[scores={lapis_gen_delay=360,lap_ore_counter=24},tag=lvl1010] run tag @s[distance=..3] remove lapis_selected
execute as @e[scores={lapis_gen_delay=360,lap_ore_counter=24},tag=lvl1010] run scoreboard players remove @s lap_ore_counter 2