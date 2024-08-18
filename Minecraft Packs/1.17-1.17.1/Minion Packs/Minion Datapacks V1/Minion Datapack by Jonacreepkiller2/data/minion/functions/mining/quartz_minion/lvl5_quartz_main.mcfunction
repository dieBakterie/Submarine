#fuse
execute as @e[tag=quarz_obfuscated] positioned as @s unless block ^ ^ ^ nether_quartz_ore run tag @s remove quarz_obfuscated
execute as @e[tag=quarz.gen,tag=!quarz_obfuscated] positioned as @s if block ^ ^ ^ nether_quartz_ore run tag @s add quarz_obfuscated
execute as @e[tag=quarz_minion,tag=lvl5] at @s if entity @e[tag=quarz.gen,limit=24,distance=..3] run tag @s add quarz.gen_true


#get minion
execute as @e[tag=quarz_minion,tag=lvl5] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"quarz remover"}'}}}}] run tag @p add quarz.crafter_lvl5
execute as @e[tag=quarz_minion,tag=lvl5] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"quarz remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace nether_quartz_ore
execute as @e[tag=quarz_minion,tag=lvl5] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"quarz remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=quarz.crafter_lvl5] run 
execute as @a[tag=quarz.crafter_lvl5] run give @s tripwire_hook{display:{Name:'{"text":"quarz remover"}'}}
execute as @a[tag=quarz.crafter_lvl5,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"quarz remover"}'}}}]}] run tag @s remove quarz.crafter_lvl5

#main
scoreboard players add @e[tag=quarz_minion,tag=lvl5] quarz_gen_delay 1
execute as @e[scores={quarz_gen_delay=230},tag=lvl5] at @s positioned as @e[distance=..3,tag=!quarz_obfuscated,tag=quarz.gen,sort=random,limit=1] run setblock ^ ^ ^ nether_quartz_ore
execute as @e[scores={quarz_gen_delay=230},tag=lvl5] run scoreboard players add @s quarz_counter 1
execute as @e[scores={quarz_counter=24},tag=lvl5] at @s run tag @e[tag=quarz_obfuscated,limit=1,sort=random] add quarz_selected
execute as @e[scores={quarz_counter=24},tag=lvl5] if entity @e[tag=quarz_selected] run function dp_by_j:mining/lvl5/lvl5_quarz_mining
execute as @e[scores={quarz_gen_delay=230,quarz_counter=1..},tag=lvl5] run scoreboard players set @s quarz_gen_delay 0