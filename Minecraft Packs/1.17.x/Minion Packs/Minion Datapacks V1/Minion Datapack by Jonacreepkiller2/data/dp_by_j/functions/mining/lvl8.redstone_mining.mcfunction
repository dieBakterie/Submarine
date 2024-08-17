execute as @e[tag=redstone_selected] positioned as @e[scores={red_ore_counter=24},tag=lvl8] run loot insert ^1 ^ ^ loot minecraft:blocks/redstone_ore
execute as @e[scores={red_gen_delay=360,red_ore_counter=24},tag=lvl8] at @s positioned as @e[tag=redstone_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=redstone_selected] at @e[scores={red_gen_delay=360,red_ore_counter=24},tag=lvl8] run tag @s[distance=..3] remove redstone_selected
execute as @e[scores={red_gen_delay=360,red_ore_counter=24},tag=lvl8] run scoreboard players remove @s red_ore_counter 2