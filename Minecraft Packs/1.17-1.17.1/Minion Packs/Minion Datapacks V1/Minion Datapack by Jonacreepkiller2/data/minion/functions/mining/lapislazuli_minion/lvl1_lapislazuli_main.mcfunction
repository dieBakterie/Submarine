#fuse
execute as @e[tag=lapis_obfuscated] positioned as @s unless block ^ ^ ^ lapis_ore run tag @s remove lapis_obfuscated
execute as @e[tag=lapis.gen,tag=!lapis_obfuscated] positioned as @s if block ^ ^ ^ lapis_ore run tag @s add lapis_obfuscated
execute as @e[tag=lapis_minion,tag=lvl1] at @s if entity @e[distance=..3,tag=lapis.gen,limit=24] run tag @s add lapis.gen_true


#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:lapis_lazuli",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @p add lapis.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:lapis_lazuli",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=lapis.crafter_lvl1] run
execute as @a[tag=lapis.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"lapis remover"}'}
execute as @a[tag=lapis.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"lapis remover"}'}}}]}] run tag @s remove lapis.crafter_lvl1
execute as @e[tag=lapis_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"lapis remover"}'}}}}] run tag @p add lapis.crafter_lvl1
execute as @e[tag=lapis_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"lapis remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace lapis_ore
execute as @e[tag=lapis_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"lapis remover"}'}}}}] run kill @e[type=!player,distance=..3]

#main
scoreboard players add @e[tag=lapis_minion,tag=lvl1] lapis_gen_delay 1
execute as @e[scores={lapis_gen_delay=360},tag=lvl1] at @s positioned as @e[distance=..3,tag=!lapis_obfuscated,tag=lapis.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ lapis_ore
execute as @e[scores={lapis_gen_delay=360},tag=lvl1] run scoreboard players add @s lap_ore_counter 1
execute as @e[scores={lap_ore_counter=24},tag=lvl1] at @s run tag @e[distance=..3,tag=lapis_obfuscated,limit=1,sort=random] add lapis_selected
execute as @e[scores={lap_ore_counter=24},tag=lvl1] at @s if entity @e[distance=..3,tag=lapis_selected] run function dp_by_j:mining/lapislazuli/lvl1/lvl1_lapis_mining
execute as @e[scores={lapis_gen_delay=360,lap_ore_counter=1..},tag=lvl1] run scoreboard players set @s lapis_gen_delay 0