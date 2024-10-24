#fuse
execute as @e[tag=coal_obfuscated] positioned as @s unless block ^ ^ ^ coal_ore run tag @s remove coal_obfuscated
execute as @e[tag=coal.gen,tag=!coal_obfuscated] positioned as @s if block ^ ^ ^ coal_ore run tag @s add coal_obfuscated
execute as @e[tag=coal_minion] at @s if entity @e[tag=coal.gen,limit=24,distance=..3] run tag @s add coal.gen_true
execute as @s[tag=coal_minion,type=random,limit=1] at @s positioned as @s unless entity @s[distance=..3,tag=coal.gen,limit=24] run function dp_by_j:mining/coal_minion/coal_marker_spawner

#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:coal",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @p add coal.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:coal",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=coal.crafter_lvl1] run give @s player_head{display:{Name:"{\"text\":\"Coal Minion\"}"},SkullOwner:{Id:[I;1328965504,1406354286,-1266257353,492851516],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODU3MDVjZjg2NGRmMmMxODJlMzJjNDg2YjcxNDdjYmY3ODJhMGFhM2RmOGE2ZDYxNDUzOTM5MGJmODRmYjE1ZCJ9fX0="}]}}}
execute as @a[tag=coal.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"coal remover"}'}}
execute as @a[tag=coal.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}]}] run tag @p remove coal.crafter_lvl1
execute as @e[tag=coal_minion] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run tag @p add coal.crafter_lvl1
execute as @e[tag=coal_minion] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace coal_ore
execute as @e[tag=coal_minion] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run kill @e[type=!player,distance=..3]

#main
scoreboard players add @e[tag=coal_minion] coal_gen_delay 1
execute as @e[scores={coal_gen_delay=140}] at @s positioned as @e[distance=..3,tag=!coal_obfuscated,tag=coal.gen,sort=random,limit=1] run setblock ^ ^ ^ coal_ore
execute as @e[scores={coal_gen_delay=140}] run scoreboard players add @s coal_ore_counter 1
execute as @e[scores={coal_ore_counter=24}] at @s run tag @e[tag=coal_obfuscated,limit=1,sort=random,distance=..3] add coal_selected
execute as @e[scores={coal_ore_counter=24}] at @s if entity @e[tag=coal_selected,sort=nearest,limit=1] run tag @s[scores={coal_ore_counter=24}] add run
execute as @e[scores={coal_gen_delay=140,coal_ore_counter=1..}] run scoreboard players set @s coal_gen_delay 0

#mining
# execute as @e[tag=coal_selected] positioned as @e[scores={coal_ore_counter=24},tag=run] run loot insert ^1 ^ ^ loot minecraft:blocks/coal_ore
# execute as @e[scores={coal_gen_delay=140,coal_ore_counter=24}] at @s positioned as @e[tag=coal_selected,distance=..3] run setblock ^ ^ ^ air
# execute as @e[tag=coal_selected] at @e[scores={coal_gen_delay=140,coal_ore_counter=24}] run tag @s[distance=..3] remove coal_selected
# execute as @e[scores={coal_gen_delay=140,coal_ore_counter=24}] run scoreboard players remove @s coal_ore_counter 2

#spawning
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^2 air run summon marker ^2 ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^2 coal_ore run summon marker ^2 ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^2 air run summon marker ^1 ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^2 coal_ore run summon marker ^1 ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^ ^-1 ^2 air run summon marker ^ ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^ ^-1 ^2 coal_ore run summon marker ^ ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^2 air run summon marker ^-1 ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^2 coal_ore run summon marker ^-1 ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^2 air run summon marker ^-2 ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^2 coal_ore run summon marker ^-2 ^-1 ^2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^1 air run summon marker ^2 ^-1 ^1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^1 coal_ore run summon marker ^2 ^-1 ^1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^1 air run summon marker ^1 ^-1 ^1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^1 coal_ore run summon marker ^1 ^-1 ^1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^ ^-1 ^1 air run summon marker ^ ^-1 ^1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^ ^-1 ^1 coal_ore run summon marker ^ ^-1 ^1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^1 air run summon marker ^-1 ^-1 ^1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^1 coal_ore run summon marker ^1 ^-1 ^ {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^1 air run summon marker ^-2 ^-1 ^1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^1 coal_ore run summon marker ^-2 ^-1 ^1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^ air run summon marker ^2 ^-1 ^ {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^ coal_ore run summon marker ^2 ^-1 ^ {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^ air run summon marker ^1 ^-1 ^ {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^ coal_ore run summon marker ^1 ^-1 ^ {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^ air run summon marker ^-1 ^-1 ^ {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^ coal_ore run summon marker ^-1 ^-1 ^ {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^ air run summon marker ^-2 ^-1 ^ {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^ coal_ore run summon marker ^-2 ^-1 ^ {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^-1 air run summon marker ^2 ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^-1 coal_ore run summon marker ^2 ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^-1 air run summon marker ^1 ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^-1 coal_ore run summon marker ^2 ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^ ^-1 ^-1 air run summon marker ^ ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^ ^-1 ^-1 coal_ore run summon marker ^ ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^-1 air run summon marker ^-1 ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^-1 coal_ore run summon marker ^-1 ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^-1 air run summon marker ^-2 ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^-1 coal_ore run summon marker ^-2 ^-1 ^-1 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^-2 air run summon marker ^2 ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^2 ^-1 ^-2 coal_ore run summon marker ^2 ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^-2 air run summon marker ^1 ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^1 ^-1 ^-2 coal_ore run summon marker ^1 ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^ ^-1 ^-2 air run summon marker ^ ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^ ^-1 ^-2 coal_ore run summon marker ^ ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^-2 air run summon marker ^-1 ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-1 ^-1 ^-2 coal_ore run summon marker ^-1 ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^-2 air run summon marker ^-2 ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen"]}
# execute as @e[tag=coal_minion,tag=!coal.gen_true] positioned as @s if block ^-2 ^-1 ^-2 coal_ore run summon marker ^-2 ^-1 ^-2 {NoGravity:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["coal.gen","coal_obfuscated"]}
