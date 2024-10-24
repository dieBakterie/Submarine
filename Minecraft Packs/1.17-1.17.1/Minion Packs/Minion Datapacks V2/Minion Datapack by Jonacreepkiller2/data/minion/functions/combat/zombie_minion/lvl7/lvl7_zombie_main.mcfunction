#fuse
execute as @e[tag=zombie_minion,tag=lvl7] at @s as @s unless entity @e[tag=zombie,distance=0..3] run scoreboard players set @s zombie_counter 0
execute as @a[scores={zombie_killer=1}] if entity @e[tag=zombie,limit=4] run scoreboard players remove @e[tag=zombie_minion,tag=lvl7,limit=1,sort=nearest] zombie_counter 1
execute as @a[scores={zombie_killer=1}] if entity @e[tag=zombie,limit=4] run scoreboard players set @s zombie_killer 0

#get minion
execute as @e[tag=zombie_minion,tag=lvl7] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"zombie remover"}'}}}}] run tag @p add zombie.crafter_lvl7
execute as @e[tag=zombie_minion,tag=lvl7] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"zombie remover"}'}}}}] run kill @e[type=!player,distance=..4]
execute as @a[tag=zombie.crafter_lvl7] run
execute as @a[tag=zombie.crafter_lvl7] run give @s tripwire_hook{display:{Name:'{"text":"zombie remover"}'}}
execute as @a[tag=zombie.crafter_lvl7,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"zombie remover"}'}}}]}] run tag @s remove zombie.crafter_lvl7

#main
scoreboard players add @e[tag=zombie_minion,tag=lvl7] zom_spawn_delay 1
execute positioned as @e[tag=zombie_minion,tag=lvl7,scores={zom_spawn_delay=260,zombie_counter=0..5},tag=lvl7] unless entity @e[tag=zombie_summon_delay,tag=lvl7] run summon minecraft:zombie ^ ^1 ^1 {PersistenceRequired:1b,Tags:["zombie"]}
execute as @e[scores={zom_spawn_delay=260},tag=lvl7] run scoreboard players add @s zombie_counter 1
execute as @e[scores={zombie_counter=5,zom_spawn_delay=260},tag=lvl7] as @s at @s run tag @s add zombie_summon_delay
execute as @e[scores={zombie_counter=6},tag=lvl7] if entity @e[tag=zombie_summon_delay,tag=lvl7] run function dp_by_j:combat/lvl7/lvl7_zombie_kill
execute as @e[scores={zom_spawn_delay=260},tag=lvl7] run scoreboard players set @s zom_spawn_delay 0