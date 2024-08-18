execute as @e[tag=obsidian_selected] positioned as @e[scores={obsidian_counter=24},tag=lvl11] run loot insert ^1 ^ ^ loot minecraft:blocks/obsidian
execute as @e[scores={obsi_gen_delay=480,obsidian_counter=24},tag=lvl11] at @s positioned as @e[tag=obsidian_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=obsidian_selected] at @e[scores={obsi_gen_delay=480,obsidian_counter=24},tag=lvl11] run tag @s[distance=..3] remove obsidian_selected
execute as @e[scores={obsi_gen_delay=480,obsidian_counter=24},tag=lvl11] run scoreboard players remove @s obsidian_counter 2