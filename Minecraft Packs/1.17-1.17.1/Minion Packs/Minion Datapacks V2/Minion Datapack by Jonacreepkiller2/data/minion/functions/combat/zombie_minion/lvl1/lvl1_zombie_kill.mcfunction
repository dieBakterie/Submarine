execute positioned as @e[scores={zombie_counter=6},tag=lvl1] run loot insert ^1 ^ ^ loot minecraft:entities/zombie
execute positioned as @e[scores={zombie_counter=6},tag=lvl1] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:potato"}}] as @s run kill @s
execute positioned as @e[scores={zombie_counter=6},tag=lvl1] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:rotten_flesh"}}] as @s run kill @s
execute positioned as @e[scores={zombie_counter=6},tag=lvl1] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:poisonous_potato"}}] as @s run kill @s
execute positioned as @e[scores={zom_spawn_delay=260,zombie_counter=6},tag=lvl1] at @s run kill @e[tag=zombie,distance=0..3,limit=1,sort=random]
execute as @e[scores={zombie_counter=6},tag=lvl1] run tag @s remove zombie_summon_delay
execute as @e[scores={zom_spawn_delay=260,zombie_counter=6},tag=!zombie_summon_delay,tag=lvl1] run scoreboard players remove @s zombie_counter 2