#fuse
execute as @e[tag=gold_obfuscated] positioned as @s unless block ^ ^ ^ gold_ore run tag @s remove gold_obfuscated
execute as @e[tag=gold.gen,tag=!gold_obfuscated] positioned as @s if block ^ ^ ^ gold_ore run tag @s add gold_obfuscated
execute as @e[tag=gold_minion,tag=lvl10] at @s if entity @e[tag=gold.gen,limit=24,distance=..3] run tag @s add gold.gen_true


#get minion
execute as @e[tag=gold_minion,tag=lvl10] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"gold remover"}'}}}}] run tag @p add gold.crafter_lvl10
execute as @e[tag=gold_minion,tag=lvl10] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"gold remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace gold_ore
execute as @e[tag=gold_minion,tag=lvl10] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"gold remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=gold.crafter_lvl10] run
execute as @a[tag=gold.crafter_lvl10] run give @s tripwire_hook{display:{Name:'{"text":"gold remover"}'}}
execute as @a[tag=gold.crafter_lvl10,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"gold remover"}'}}}]}] run tag @s remove gold.crafter_lvl10

#main
scoreboard players add @e[tag=gold_minion,tag=lvl10] gold_gen_delay 1
execute as @e[scores={gold_gen_delay=220},tag=lvl10] at @s positioned as @e[distance=..3,tag=!gold_obfuscated,tag=gold.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ gold_ore
execute as @e[scores={gold_gen_delay=220},tag=lvl10] run scoreboard players add @s gold_ore_counter 1
execute as @e[scores={gold_ore_counter=24},tag=lvl10] at @s run tag @e[distance=..3,tag=gold_obfuscated,limit=1,sort=random] add gold_selected
execute as @e[scores={gold_ore_counter=24},tag=lvl10] if entity @e[tag=gold_selected] run function dp_by_j:mining/lvl10/lvl10_gold_mining
execute as @e[scores={gold_gen_delay=220,gold_ore_counter=1..},tag=lvl10] run scoreboard players set @s gold_gen_delay 0