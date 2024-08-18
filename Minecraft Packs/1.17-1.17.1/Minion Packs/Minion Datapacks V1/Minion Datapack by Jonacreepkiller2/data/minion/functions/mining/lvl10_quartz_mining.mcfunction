execute positioned as @e[scores={quarz_counter=24},tag=lvl1010] run loot insert ^1 ^ ^ loot minecraft:blocks/nether_quarz_ore
execute as @e[scores={quarz_gen_delay=230,quarz_counter=24},tag=lvl1010] at @s positioned as @e[tag=quarz_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=quarz_selected] at @e[scores={quarz_gen_delay=230,quarz_counter=24},tag=lvl1010] run tag @s[distance=..3] remove quarz_selected
execute as @e[scores={quarz_gen_delay=230,quarz_counter=24},tag=lvl1010] run scoreboard players remove @s quarz_counter 2