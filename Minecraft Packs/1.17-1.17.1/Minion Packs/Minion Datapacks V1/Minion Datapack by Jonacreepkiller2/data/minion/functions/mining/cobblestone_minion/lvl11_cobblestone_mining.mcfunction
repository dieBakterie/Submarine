execute as @e[tag=cobblestone_selected] positioned as @e[scores={cobble_counter=24},tag=lvl11] run loot insert ^1 ^ ^ loot minecraft:blocks/cobblestone
execute as @e[scores={cob_gen_delay=140,cobble_counter=24},tag=lvl11] at @s positioned as @e[tag=cobblestone_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=cobblestone_selected] at @e[scores={cob_gen_delay=140,cobble_counter=24},tag=lvl11] run tag @s[distance=..3] remove cobblestone_selected
execute as @e[scores={cob_gen_delay=140,cobble_counter=24},tag=lvl11] run scoreboard players remove @s cobble_counter 2