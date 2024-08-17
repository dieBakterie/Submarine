#fuse
execute as @e[tag=coal_obfuscated] positioned as @s unless block ^ ^ ^ coal_ore run tag @s remove coal_obfuscated
execute as @e[tag=coal.gen,tag=!coal_obfuscated] positioned as @s if block ^ ^ ^ coal_ore run tag @s add coal_obfuscated
execute as @e[tag=coal_minion,tag=lvl11] at @s if entity @e[tag=coal.gen,limit=24,distance=..3] run tag @s add coal.gen_true


#get minion
execute as @e[tag=coal_minion,tag=lvl11] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run tag @p add coal.crafter_lvl11
execute as @e[tag=coal_minion,tag=lvl11] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace coal_ore
execute as @e[tag=coal_minion,tag=lvl11] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=coal.crafter_lvl11] run give @s player_head{display:{Name:"{\"text\":\"Coal Minion XI\"}"},SkullOwner:{Id:[I;1305130776,-538098464,-1665992221,-688514959],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNGQ0NzI3YzFhMDc5YjA1YzQzZGJmODU3ZGQzZDFmZDk1ZWQ3OTFmZTcyODM3YmM0YjJlYjM2MDAyZDM0ZmVlNiJ9fX0="}]}}}
execute as @a[tag=coal.crafter_lvl11] run give @s tripwire_hook{display:{Name:'{"text":"coal remover"}'}}
execute as @a[tag=coal.crafter_lvl11,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}]}] run tag @s remove coal.crafter_lvl11

#main
scoreboard players add @e[tag=coal_minion,tag=lvl11] coal_gen_delay 1
execute as @e[scores={coal_gen_delay=140},tag=lvl11] at @s positioned as @e[distance=..3,tag=!coal_obfuscated,tag=coal.gen,sort=random,limit=1] run setblock ^ ^ ^ coal_ore
execute as @e[scores={coal_gen_delay=140},tag=lvl11] run scoreboard players add @s coal_ore_counter 1
execute as @e[scores={coal_ore_counter=24},tag=lvl11] at @s run tag @e[tag=coal_obfuscated,limit=1,sort=random,distance=..3] add coal_selected
execute as @e[scores={coal_ore_counter=24},tag=lvl11] if entity @e[tag=coal_selected] run function dp_by_j:mining/lvl11.coal_mining
execute as @e[scores={coal_gen_delay=140,coal_ore_counter=1..},tag=lvl11] run scoreboard players set @s coal_gen_delay 0