#fuse
execute as @e[tag=obsidian_obfuscated] positioned as @s unless block ^ ^ ^ obsidian run tag @s remove obsidian_obfuscated
execute as @e[tag=obsidian.gen,tag=!obsidian_obfuscated] positioned as @s if block ^ ^ ^ obsidian run tag @s add obsidian_obfuscated
execute as @e[tag=obsidian_minion,tag=lvl1] at @s if entity @e[tag=obsidian.gen,limit=24,distance=..3] run tag @s add obsidian.gen_true


#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:obsidian",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @p add obsidian.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:obsidian",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=obsidian.crafter_lvl1] run 
execute as @a[tag=obsidian.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"obsidian remover"}'}}
execute as @a[tag=obsidian.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"obsidian remover"}'}}}]}] run tag @s remove obsidian.crafter_lvl1
execute as @e[tag=obsidian_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"obsidian remover"}'}}}}] run tag @p add obsidian.crafter_lvl1
execute as @e[tag=obsidian_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"obsidian remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace obsidian
execute as @e[tag=obsidian_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"obsidian remover"}'}}}}] run kill @e[type=!player,distance=..3]

#main
scoreboard players add @e[tag=obsidian_minion,tag=lvl1] obsi_gen_delay 1
execute as @e[scores={obsi_gen_delay=480},tag=lvl1] at @s positioned as @e[distance=..3,tag=!obsidian_obfuscated,tag=obsidian.gen,sort=random,limit=1] run setblock ^ ^ ^ obsidian
execute as @e[scores={obsi_gen_delay=480},tag=lvl1] run scoreboard players add @s obsidian_counter 1
execute as @e[scores={obsidian_counter=24},tag=lvl1] at @s run tag @e[distance=..3,tag=obsidian_obfuscated,limit=1,sort=random] add obsidian_selected
execute as @e[scores={obsidian_counter=24},tag=lvl1] if entity @e[tag=obsidian_selected] run function dp_by_j:mining/obsidian_minion/obsidian_minion/obsidian/lvl1/lvl1_obsidian_mining
execute as @e[scores={obsi_gen_delay=480,obsidian_counter=1..},tag=lvl1] run scoreboard players set @s obsi_gen_delay 0