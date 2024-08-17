#fuse
execute as @e[tag=iron_obfuscated] positioned as @s unless block ^ ^ ^ iron_ore run tag @s remove iron_obfuscated
execute as @e[tag=iron.gen,tag=!iron_obfuscated] positioned as @s if block ^ ^ ^ iron_ore run tag @s add iron_obfuscated
execute as @e[tag=iron_minion,tag=lvl1] at @s if entity @e[tag=iron.gen,limit=24,distance=..3] run tag @s add iron.gen_true


#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",Count:64b}},tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}},tag=lvl1] run tag @p add iron.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:iron_ingot",Count:64b}},tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}},tag=lvl1] run kill @e[type=item,distance=..0.75]
execute as @a[tag=iron.crafter_lvl1] run 
execute as @a[tag=iron.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"iron remover"}'}}
execute as @a[tag=iron.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"iron remover","color":"dark_purple"}'}}}]}] run tag @s add iron.crafter_lvl1
execute as @e[tag=iron_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"iron remover"}'}}}}] run tag @p add iron.crafter_lvl1
execute as @e[tag=iron_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"iron remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace iron_ore
execute as @e[tag=iron_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"iron remover"}'}}}}] run kill @e[type=!player,distance=..3]

#main
scoreboard players add @e[tag=iron_minion,tag=lvl1] iron_gen_delay 1
execute as @e[scores={iron_gen_delay=160},tag=lvl1] at @s positioned as @e[distance=..3,tag=!iron_obfuscated,tag=iron.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ iron_ore
execute as @e[scores={iron_gen_delay=160},tag=lvl1] run scoreboard players add @s iron_ore_counter 1
execute as @e[scores={iron_ore_counter=24},tag=lvl1] at @s run tag @e[distance=..3,tag=iron_obfuscated,limit=1,sort=random] add iron_selected
execute as @e[scores={iron_ore_counter=24},tag=lvl1] if entity @e[tag=iron_selected] run function dp_by_j:mining/lvl1.iron_mining
execute as @e[scores={iron_gen_delay=160,iron_ore_counter=1..},tag=lvl1] run scoreboard players set @s iron_gen_delay 0