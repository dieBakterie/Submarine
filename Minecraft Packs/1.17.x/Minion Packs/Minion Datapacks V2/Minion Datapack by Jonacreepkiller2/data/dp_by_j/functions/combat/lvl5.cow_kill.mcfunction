execute positioned as @e[scores={cow_counter=6},tag=lvl5] run loot insert ^1 ^ ^ loot minecraft:entities/cow
execute positioned as @e[scores={cow_counter=6},tag=lvl5] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:beef"}},tag=lvl5] as @s run kill @s
execute positioned as @e[scores={cow_counter=6},tag=lvl5] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:leather"}},tag=lvl5] as @s run kill @s
execute as @e[scores={cow_spawn_delay=260,cow_counter=6},tag=lvl5] run kill @e[tag=cow,limit=1,sort=random]
execute as @e[scores={cow_counter=6},tag=lvl5] run tag @s remove cow_summon_delay
execute as @e[scores={cow_spawn_delay=260,cow_counter=6},tag=!cow_summon_delay,tag=lvl5] run scoreboard players remove @s cow_counter 2