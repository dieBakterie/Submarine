execute as @e[tag=gold_selected] positioned as @e[scores={gold_ore_counter=24},tag=lvl1] run loot insert ^1 ^ ^ loot minecraft:blocks/gold_ore
execute as @e[scores={gold_gen_delay=220,gold_ore_counter=24},tag=lvl1] at @s positioned as @e[tag=gold_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=gold_selected] at @e[scores={gold_gen_delay=220,gold_ore_counter=24},tag=lvl1] run tag @s[distance=..3] remove gold_selected
execute as @e[scores={gold_gen_delay=220,gold_ore_counter=24},tag=lvl1] run scoreboard players remove @s gold_ore_counter 2