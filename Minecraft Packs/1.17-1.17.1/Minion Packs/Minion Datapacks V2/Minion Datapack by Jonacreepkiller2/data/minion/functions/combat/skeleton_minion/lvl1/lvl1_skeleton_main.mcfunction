#fuse
execute as @e[tag=skeleton_minion,tag=lvl1] at @s as @s unless entity @e[tag=skeleton,distance=0..3] run scoreboard players set @s skeleton_counter 0
execute as @a[scores={skeleton_killer=1}] if entity @e[tag=skeleton,limit=4] run scoreboard players remove @e[tag=skeleton_minion,limit=1,sort=nearest] skeleton_counter 1
execute as @a[scores={skeleton_killer=1}] if entity @e[tag=skeleton,limit=4] run scoreboard players set @s skeleton_killer 0

#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:bone",Count:64b}},tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run tag @p add skeleton.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:bone",Count:64b}},tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=skeleton.crafter_lvl1] run give @s minecraft:ghast_spawn_egg{display:{Name:'{"text":"Skeleton Minion","color":"dark_purple"}',Lore:['{"text":"Use this Spawn Egg to spawn your Minion.","color":"dark_purple"}']},EntityTag:{id:"minecraft:armor_stand",NoGravity:1b,Invulnerable:1b,ShowArms:1b,Small:1b,NoBasePlate:1b,PersistenceRequired:1b,Tags:["skeleton_minion","lvl1"],DisabledSlots:4144959,Rotation:[0.0F,0.0F],HandItems:[{id:'minecraft:wooden_sword',Count:1b},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16645629}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16645629}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16645629}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-1711669266,-880982734,-1884993447,-835162161],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZmI0Yzg2OWI5YzBmYmE1OTJjOTY4NTQ0ZmM1MTFkNTdkYmFmNzU3Zjg0YzY0NWNkYWM0MDgzYjQzNjI4Mzk1MSJ9fX0="}]}}}}],CustomName:'{"text":"Skeleton Minion","color":"dark_purple"}'}}
execute as @a[tag=skeleton.crafter_lvl1] run give @s minecraft:tripwire_hook{display:{Name:'{"text":"skeleton remover"}'}}
execute as @a[tag=skeleton.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"skeleton remover"}'}}},tag=lvl1]},tag=lvl1] run tag @s remove skeleton.crafter_lvl1
execute as @e[tag=skeleton_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"skeleton remover"}'}}}}] run tag @p add skeleton.crafter_lvl1
execute as @e[tag=skeleton_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"skeleton remover"}'}}}}] run kill @e[type=!player,distance=..4]

#main
scoreboard players add @e[tag=skeleton_minion,tag=lvl1] skel_spawn_delay 1
execute positioned as @e[scores={skel_spawn_delay=260,skeleton_counter=0..5},tag=lvl1] at @s unless entity @e[distance=0..3,tag=skeleton_summon_delay,tag=lvl1] run summon minecraft:skeleton ^ ^1 ^1 {PersistenceRequired:1b,Tags:["skeleton"]}
execute as @e[scores={skel_spawn_delay=260},tag=lvl1] run scoreboard players add @s skeleton_counter 1
execute as @e[scores={skeleton_counter=5,skeleton_spawn_delay=260},tag=lvl1] run tag @s add skeleton_summon_delay
execute as @e[scores={skeleton_counter=6},tag=lvl1] at @s if entity @e[distance=0..3,tag=skeleton_summon_delay,tag=lvl1] run function dp_by_j:combat/lvl1/lvl1_skeleton_kill
execute as @e[scores={skel_spawn_delay=260},tag=lvl1] run scoreboard players set @s skel_spawn_delay 0