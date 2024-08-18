execute as @e[tag=glowstone_selected] positioned as @e[scores={glow_counter=24},tag=lvl5] run loot insert ^1 ^ ^ loot minecraft:blocks/glowstone
execute as @e[scores={glow_gen_delay=260,glow_counter=24},tag=lvl5] at @s positioned as @e[tag=glowstone_selected,distance=..3] run setblock ^ ^ ^ air
execute as @e[tag=glowstone_selected] at @e[scores={glow_gen_delay=260,glow_counter=24},tag=lvl5] run tag @s[distance=..3] remove glowstone_selected
execute as @e[scores={glow_gen_delay=260,glow_counter=24},tag=lvl5] run scoreboard players remove @s glow_counter 2