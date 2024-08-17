execute positioned as @e[scores={zombie_counter=6},tag=lvl4] run loot insert ^1 ^ ^ loot minecraft:entities/zombie
execute positioned as @e[scores={zombie_counter=6},tag=lvl4] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:potato"}},tag=lvl4] as @s run kill @s
execute positioned as @e[scores={zombie_counter=6},tag=lvl4] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:rotten_flesh"}},tag=lvl4] as @s run kill @s
execute positioned as @e[scores={zombie_counter=6},tag=lvl4] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:poisonous_potato"}},tag=lvl4] as @s run kill @s
execute as @e[scores={zom_spawn_delay=260,zombie_counter=6},tag=lvl4] run kill @e[tag=zombie,limit=1,sort=random]
execute as @e[scores={zombie_counter=6},tag=lvl4] run tag @s remove zombie_summon_delay
execute as @e[scores={zom_spawn_delay=260,zombie_counter=6},tag=!zombie_summon_delay,tag=lvl4] run scoreboard players remove @s zombie_counter 2