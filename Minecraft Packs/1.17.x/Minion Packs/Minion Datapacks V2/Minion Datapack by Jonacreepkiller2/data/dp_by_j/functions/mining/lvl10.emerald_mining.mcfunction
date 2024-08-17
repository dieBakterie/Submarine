execute as @e[tag=emerald_selected] positioned as @e[scores={eme_ore_counter=24},tag=lvl1010] run loot insert ^1 ^ ^ loot minecraft:blocks/emerald_ore
execute as @e[scores={eme_gen_delay=280,eme_ore_counter=24},tag=lvl1010] at @s positioned as @e[tag=emerald_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=emerald_selected] at @e[scores={eme_gen_delay=280,eme_ore_counter=24},tag=lvl1010] run tag @s[distance=..3] remove emerald_selected
execute as @e[scores={eme_gen_delay=280,eme_ore_counter=24},tag=lvl1010] run scoreboard players remove @s eme_ore_counter 2