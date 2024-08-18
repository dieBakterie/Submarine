execute positioned as @e[scores={skeleton_counter=6},tag=lvl11] run loot insert ^1 ^ ^ loot minecraft:entities/skeleton
execute positioned as @e[scores={skeleton_counter=6},tag=lvl11] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:bone"}},tag=lvl11] as @s run kill @s
execute positioned as @e[scores={skeleton_counter=6},tag=lvl11] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:arrow"}},tag=lvl11] as @s run kill @s
execute as @e[scores={skel_spawn_delay=260,skeleton_counter=6},tag=lvl11] as @s run kill @e[tag=skeleton,limit=1,sort=random]
execute as @e[scores={skeleton_counter=6},tag=lvl11] as @s run tag @s remove skeleton_summon_delay
execute as @e[scores={skel_spawn_delay=260,skeleton_counter=6},tag=!skeleton_summon_delay,tag=lvl11] as @s run scoreboard players remove @e[tag=skeleton_minion,tag=lvl11] skeleton_counter 2