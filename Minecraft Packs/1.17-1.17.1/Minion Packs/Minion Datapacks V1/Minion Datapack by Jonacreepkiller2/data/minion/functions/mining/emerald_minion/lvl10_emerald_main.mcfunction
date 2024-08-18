#fuse
execute as @e[tag=emerald_obfuscated] positioned as @s unless block ^ ^ ^ emerald_ore run tag @s remove emerald_obfuscated
execute as @e[tag=emerald.gen,tag=!emerald_obfuscated] positioned as @s if block ^ ^ ^ emerald_ore run tag @s add emerald_obfuscated
execute as @e[tag=emerald_minion,tag=lvl10] at @s if entity @e[distance=..3,tag=emerald.gen,limit=24] run tag @s add emerald.gen_true


#get minion
execute as @e[tag=emerald_minion,tag=lvl10] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run tag @p add emerald.crafter_lvl10
execute as @e[tag=emerald_minion,tag=lvl10] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace emerald_ore
execute as @e[tag=emerald_minion,tag=lvl10] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=emerald.crafter_lvl10] run give @s player_head{display:{Name:"{\"text\":\"Emerald Minion X\"}"},SkullOwner:{Id:[I;-582215574,-1428340635,-1947063265,-855137071],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjllYTgzYjEzNTllMDFiNDJjZDUxYzQ5YjEzMWZiN2E1Mzc4OTRmYmZjYTg3YmRlYmQ0NjAzM2U1NTE2ZTAyYiJ9fX0="}]}}}
execute as @a[tag=emerald.crafter_lvl10] run give @s tripwire_hook{display:{Name:'{"text":"emerald remover"}'}}
execute as @a[tag=emerald.crafter_lvl10,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}]}] run tag @p remove emerald.crafter_lvl10

#main
scoreboard players add @e[tag=emerald_minion,tag=lvl10] eme_gen_delay 1
execute as @e[scores={eme_gen_delay=280},tag=lvl10] at @s positioned as @e[distance=..3,tag=!emerald_obfuscated,tag=emerald.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ emerald_ore
execute as @e[scores={eme_gen_delay=280},tag=lvl10] run scoreboard players add @s eme_ore_counter 1
execute as @e[scores={eme_ore_counter=24},tag=lvl10] at @s run tag @e[distance=..3,tag=emerald_obfuscated,limit=1,sort=random] add emerald_selected
execute as @e[scores={eme_ore_counter=24},tag=lvl10] if entity @e[tag=emerald_selected] run function dp_by_j:mining/lvl10/lvl10_emerald_mining
execute as @e[scores={eme_gen_delay=280,eme_ore_counter=1..},tag=lvl10] run scoreboard players set @s eme_gen_delay 0