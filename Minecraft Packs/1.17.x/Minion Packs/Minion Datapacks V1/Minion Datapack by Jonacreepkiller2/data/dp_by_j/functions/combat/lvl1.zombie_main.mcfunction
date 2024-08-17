#fuse
execute as @e[tag=zombie_minion,tag=lvl1] at @s as @s unless entity @e[tag=zombie,distance=0..3] run scoreboard players set @s zombie_counter 0
execute as @a[scores={zombie_killer=1}] if entity @e[tag=zombie,limit=4] run scoreboard players remove @e[tag=zombie_minion,tag=lvl1,limit=1,sort=nearest] zombie_counter 1
execute as @a[scores={zombie_killer=1}] if entity @e[tag=zombie,limit=4] run scoreboard players set @s zombie_killer 0

#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run tag @p add zombie.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=zombie.crafter_lvl1] run give @s minecraft:ghast_spawn_egg{display:{Name:'{"text":"Zombie Minion","color":"dark_purple"}',Lore:['{"text":"Use this Spawn Egg to spawn your Minion.","color":"dark_purple"}']},EntityTag:{id:"minecraft:armor_stand",NoGravity:1b,Invulnerable:1b,ShowArms:1b,Small:1b,NoBasePlate:1b,PersistenceRequired:1b,Tags:["zombie_minion","lvl1"],DisabledSlots:4144959,Rotation:[0.0F,0.0F],HandItems:[{id:'minecraft:wooden_sword',Count:1b}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:12056486}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:12056486}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:12056486}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-1659456719,-39695649,-1969187951,786805657],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZThmZmY2NzQ1ODdmNjEwOTRjMzE5NmFiZDU2NWI0NGQ4MDZkNzU3NDA1YTZkMjY2MWE3Yjc5N2MxMTQ0YjZhNCJ9fX0="}]}}}}]}}
execute as @a[tag=zombie.crafter_lvl1] run give @s minecraft:tripwire_hook{display:{Name:'{"text":"zombie remover"}'}}
execute as @a[tag=zombie.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"zombie remover"}'}}}]}] run tag @s remove zombie.crafter_lvl1
execute as @e[tag=zombie_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"zombie remover"}'}}}}] run tag @p add zombie.crafter_lvl1
execute as @e[tag=zombie_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"zombie remover"}'}}}}] run kill @e[type=!player,distance=..4]

#main
scoreboard players add @e[tag=zombie_minion,tag=lvl1] zom_spawn_delay 1
execute positioned as @e[tag=zombie_minion,scores={zom_spawn_delay=260,zombie_counter=0..5},tag=lvl1] at @s unless entity @e[distance=0..3,tag=zombie_summon_delay,tag=lvl1] run summon minecraft:zombie ^ ^1 ^1 {PersistenceRequired:1b,Tags:["zombie"]}
execute as @e[scores={zom_spawn_delay=260},tag=lvl1] run scoreboard players add @s zombie_counter 1
execute as @e[scores={zombie_counter=5,zom_spawn_delay=260},tag=lvl1] as @s run tag @s add zombie_summon_delay
execute as @e[scores={zombie_counter=6},tag=lvl1] at @s if entity @e[distance=0..3,tag=zombie_summon_delay,tag=lvl1] run function dp_by_j:combat/lvl1.zombie_kill
execute as @e[scores={zom_spawn_delay=260},tag=lvl1] run scoreboard players set @s zom_spawn_delay 0