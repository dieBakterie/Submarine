#fuse
execute as @e[tag=lapis_obfuscated] positioned as @s unless block ^ ^ ^ lapis_ore run tag @s remove lapis_obfuscated
execute as @e[tag=lapis.gen,tag=!lapis_obfuscated] positioned as @s if block ^ ^ ^ lapis_ore run tag @s add lapis_obfuscated
execute as @e[tag=lapis_minion,tag=lvl7] at @s if entity @e[distance=..3,tag=lapis.gen,limit=24] run tag @s add lapis.gen_true


#get minion
execute as @e[tag=lapis_minion,tag=lvl7] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"lapis remover"}'}}}}] run tag @p add lapis.crafter_lvl7
execute as @e[tag=lapis_minion,tag=lvl7] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"lapis remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace lapis_ore
execute as @e[tag=lapis_minion,tag=lvl7] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"lapis remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=lapis.crafter_lvl7] run 
execute as @a[tag=lapis.crafter_lvl7] run give @s tripwire_hook{display:{Name:'{"text":"lapis remover"}'}}
execute as @a[tag=lapis.crafter_lvl7,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"lapis remover"}'}}}]}] run tag @s remove lapis.crafter_lvl7

#main
scoreboard players add @e[tag=lapis_minion,tag=lvl7] lapis_gen_delay 1
execute as @e[scores={lapis_gen_delay=360},tag=lvl7] at @s positioned as @e[distance=..3,tag=!lapis_obfuscated,tag=lapis.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ lapis_ore
execute as @e[scores={lapis_gen_delay=360},tag=lvl7] run scoreboard players add @s lap_ore_counter 1
execute as @e[scores={lap_ore_counter=24},tag=lvl7] at @s run tag @e[distance=..3,tag=lapis_obfuscated,limit=1,sort=random] add lapis_selected
execute as @e[scores={lap_ore_counter=24},tag=lvl7] at @s if entity @e[distance=..3,tag=lapis_selected] run function dp_by_j:mining/lapislazuli/lvl7/lvl7_lapis_mining
execute as @e[scores={lapis_gen_delay=360,lap_ore_counter=1..},tag=lvl7] run scoreboard players set @s lapis_gen_delay 0