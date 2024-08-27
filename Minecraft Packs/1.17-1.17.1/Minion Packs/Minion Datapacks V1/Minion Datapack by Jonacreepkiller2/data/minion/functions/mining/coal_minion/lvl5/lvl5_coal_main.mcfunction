#fuse
execute as @e[tag=coal_obfuscated] positioned as @s unless block ^ ^ ^ coal_ore run tag @s remove coal_obfuscated
execute as @e[tag=coal.gen,tag=!coal_obfuscated] positioned as @s if block ^ ^ ^ coal_ore run tag @s add coal_obfuscated
execute as @e[tag=coal_minion,tag=lvl5] at @s if entity @e[tag=coal.gen,limit=24,distance=..3] run tag @s add coal.gen_true


#get minion
execute as @e[tag=coal_minion,tag=lvl5] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run tag @p add coal.crafter_lvl5
execute as @e[tag=coal_minion,tag=lvl5] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace coal_ore
execute as @e[tag=coal_minion,tag=lvl5] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=coal.crafter_lvl5] run give @s player_head{display:{Name:"{\"text\":\"Coal Minion V\"}"},SkullOwner:{Id:[I;-206436541,-976403876,-1587396225,-869424196],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNmVmZTk1ZmQ1NjhhY2UxMTNmM2E3ZGQwMGU0ZDlhMjUzNmQ3MGU4MjZjODU5MmE0MzY4Y2E1NTI1N2ZjMTk0YyJ9fX0="}]}}}
execute as @a[tag=coal.crafter_lvl5] run give @s tripwire_hook{display:{Name:'{"text":"coal remover"}'}}
execute as @a[tag=coal.crafter_lvl5,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}]}] run tag @s remove coal.crafter_lvl5

#main
scoreboard players add @e[tag=coal_minion,tag=lvl5] coal_gen_delay 1
execute as @e[scores={coal_gen_delay=140},tag=lvl5] at @s positioned as @e[distance=..3,tag=!coal_obfuscated,tag=coal.gen,sort=random,limit=1] run setblock ^ ^ ^ coal_ore
execute as @e[scores={coal_gen_delay=140},tag=lvl5] run scoreboard players add @s coal_ore_counter 1
execute as @e[scores={coal_ore_counter=24},tag=lvl5] at @s run tag @e[tag=coal_obfuscated,limit=1,sort=random,distance=..3] add coal_selected
execute as @e[scores={coal_ore_counter=24},tag=lvl5] if entity @e[tag=coal_selected] run function dp_by_j:mining/coal_minion/lvl5/lvl5_coal_mining
execute as @e[scores={coal_gen_delay=140,coal_ore_counter=1..},tag=lvl5] run scoreboard players set @s coal_gen_delay 0