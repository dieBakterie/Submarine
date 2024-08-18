#fuse
execute as @e[tag=glowstone_obfuscated] positioned as @s unless block ^ ^ ^ glowstone run tag @s remove glowstone_obfuscated
execute as @e[tag=glowstone.gen,tag=!glowstone_obfuscated] positioned as @s if block ^ ^ ^ glowstone run tag @s add glowstone_obfuscated
execute as @e[tag=glowstone_minion,tag=lvl1] at @s if entity @e[tag=glowstone.gen,limit=24,distance=..3] run tag @s add glowstone.gen_true


#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @p add glowstone.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=glowstone.crafter_lvl1] run give @s player_head{display:{Name:"{\"text\":\"Glowstone Minion\"}"},SkullOwner:{Id:[I;-1300865007,-430682384,-1881439081,328251765],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTFmNGYwOTY5NjY4YzM2ZThiNzM5ODE2NWViY2YyYTEzM2NhODhiMmI4YjNiZTZlOWM2Mzg0MzIwZmZiMTUwNyJ9fX0="}]}}}
execute as @a[tag=glowstone.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"glowstone remover"}'}}
execute as @a[tag=glowstone.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"glowstone remover"}'}}}]}] run tag @s remove glowstone.crafter_lvl1
execute as @e[tag=glowstone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"glowstone remover"}'}}}}] run tag @p add glowstone.crafter_lvl1
execute as @e[tag=glowstone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"glowstone remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace glowstone
execute as @e[tag=glowstone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"glowstone remover"}'}}}}] run kill @e[type=!player,distance=..3]

#main
scoreboard players add @e[tag=glowstone_minion,tag=lvl1] glow_gen_delay 1
execute as @e[scores={glow_gen_delay=260},tag=lvl1] at @s positioned as @e[tag=!glowstone_obfuscated,tag=glowstone.gen,sort=random,limit=1,distance=..3] if block ^ ^ ^ air run setblock ^ ^ ^ glowstone
execute as @e[scores={glow_gen_delay=260},tag=lvl1] run scoreboard players add @s glow_counter 1
execute as @e[scores={glow_counter=24},tag=lvl1] at @s run tag @e[tag=glowstone_obfuscated,limit=1,sort=random,distance=..3] add glowstone_selected
execute as @e[scores={glow_counter=24},tag=lvl1] if entity @e[tag=glowstone_selected] run function dp_by_j:mining/glowstone_minion/glowstone/lvl1/lvl1_glowstone_mining
execute as @e[scores={glow_gen_delay=260,glow_counter=1..},tag=lvl1] run scoreboard players set @s glow_gen_delay 0