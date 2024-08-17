execute as @e[tag=iron_selected] positioned as @e[scores={iron_ore_counter=24},tag=lvl1] run loot insert ^1 ^ ^ loot minecraft:blocks/iron_ore
execute as @e[scores={iron_gen_delay=160,iron_ore_counter=24},tag=lvl1] at @s positioned as @e[tag=iron_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=iron_selected] at @e[scores={iron_gen_delay=160,iron_ore_counter=24},tag=lvl1] run tag @s[distance=..3] remove iron_selected
execute as @e[scores={iron_gen_delay=160,iron_ore_counter=24},tag=lvl1] run scoreboard players remove @s iron_ore_counter 2