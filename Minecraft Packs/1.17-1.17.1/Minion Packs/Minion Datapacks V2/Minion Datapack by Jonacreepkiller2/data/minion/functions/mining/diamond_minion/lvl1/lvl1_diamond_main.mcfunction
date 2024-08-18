#fuse
execute as @e[tag=diamond_obfuscated] positioned as @s unless block ^ ^ ^ diamond_ore run tag @s remove diamond_obfuscated
execute as @e[tag=diamond.gen,tag=!diamond_obfuscated] positioned as @s if block ^ ^ ^ diamond_ore run tag @s add diamond_obfuscated
execute as @e[tag=diamond_minion,tag=lvl1] at @s if entity @e[tag=diamond.gen,limit=24,distance=..3] run tag @s add diamond.gen_true

#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @p add diamond.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=diamond.crafter_lvl1] run give @s player_head{display:{Name:"{\"text\":\"Diamond Minion I\"}"},SkullOwner:{Id:[I;214838598,-1813691575,-1142235253,211373996],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZmRiMDA4MDY4ODIzODQ0ZDEyOWVmZDgzOWM4MzA2NTBkOThlZWE4MTA0Y2YyYjMyNmE5YmU3ZGZiMTdhYjk5ZCJ9fX0="}]}}}
execute as @a[tag=diamond.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"diamond remover"}'}}
execute as @a[tag=diamond.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"diamond remover"}'}}}]}] run tag @s remove diamond.crafter_lvl1
execute as @e[tag=diamond_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"diamond remover"}'}}}}] run tag @p add diamond.crafter_lvl1
execute as @e[tag=diamond_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"diamond remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace diamond_ore
execute as @e[tag=diamond_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"diamond remover"}'}}}}] run kill @e[type=!player,distance=..3]

#main
scoreboard players add @e[tag=diamond_minion,tag=lvl1] dia_gen_delay 1
execute as @e[scores={dia_gen_delay=300},tag=lvl1] at @s positioned as @e[distance=..3,tag=!diamond_obfuscated,tag=diamond.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ diamond_ore
execute as @e[scores={dia_gen_delay=300},tag=lvl1] run scoreboard players add @s dia_ore_counter 1
execute as @e[scores={dia_ore_counter=24},tag=lvl1] at @s run tag @e[distance=..3,tag=diamond_obfuscated,limit=1,sort=random] add diamond_selected
execute as @e[scores={dia_ore_counter=24},tag=lvl1] if entity @e[tag=diamond_selected] run function dp_by_j:mining/diamond_minion/lvl1/lvl1_diamond_mining
execute as @e[scores={dia_gen_delay=300,dia_ore_counter=1..},tag=lvl1] run scoreboard players set @s dia_gen_delay 0