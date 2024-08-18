#fuse
execute as @e[tag=cobblestone_obfuscated] positioned as @s unless block ^ ^ ^ cobblestone run tag @s remove cobblestone_obfuscated
execute as @e[tag=cobblestone.gen,tag=!cobblestone_obfuscated] positioned as @s if block ^ ^ ^ cobblestone run tag @s add cobblestone_obfuscated
execute as @e[tag=cobblestone_minion,tag=lvl1] at @s if entity @e[tag=cobblestone.gen,limit=24,distance=..3] run tag @s add cobblestone.gen_true


#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:cobblestone",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @p add cobblestone.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:cobblestone",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=cobblestone.crafter_lvl1] run give @s player_head{display:{Name:"{\"text\":\"Cobblestone Minion\"}"},SkullOwner:{Id:[I;1085844244,-1446688870,-1996481596,2086116866],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjljMzhmZTRmYzk4YTI0ODA3OWNkMDRjNjViNmJmZjliNDUwMTdmMTY0NjBkYWIzYzM0YzE3YmZjM2VlMWQyZiJ9fX0="}]}}}
execute as @a[tag=cobblestone.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"cobblestone remover"}'}}
execute as @a[tag=cobblestone.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cobblestone remover"}'}}}]}] run tag @s remove cobblestone.crafter_lvl1
execute as @e[tag=cobblestone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cobblestone remover"}'}}}}] run tag @p add cobblestone.crafter_lvl1
execute as @e[tag=cobblestone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cobblestone remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace cobblestone
execute as @e[tag=cobblestone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cobblestone remover"}'}}}}] run kill @e[type=!player,distance=..3]

#main
scoreboard players add @e[tag=cobblestone_minion,tag=lvl1] cob_gen_delay 1
execute as @e[scores={cob_gen_delay=140},tag=lvl1] at @s positioned as @e[tag=!cobblestone_obfuscated,tag=cobblestone.gen,sort=random,limit=1,distance=..3] run setblock ^ ^ ^ cobblestone
execute as @e[scores={cob_gen_delay=140},tag=lvl1] run scoreboard players add @s cobble_counter 1
execute as @e[scores={cobble_counter=24},tag=lvl1] at @s run tag @e[distance=..3,tag=cobblestone_obfuscated,limit=1,sort=random] add cobblestone_selected
execute as @e[scores={cobble_counter=24},tag=lvl1] if entity @e[tag=cobblestone_selected] run function dp_by_j:mining/lvl1/lvl1_cobblestone_mining
execute as @e[scores={cob_gen_delay=140,cobble_counter=1..},tag=lvl1] run scoreboard players set @s cob_gen_delay 0