execute positioned as @e[scores={slime_counter=6},tag=lvl6] run loot insert ^1 ^ ^ loot minecraft:entities/slime
execute positioned as @e[scores={slime_counter=6},tag=lvl6] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:slime_ball"}},tag=lvl6] as @s run kill @s
execute as @e[scores={sli_spawn_delay=240,slime_counter=6},tag=lvl6] run kill @e[tag=slime,limit=1,sort=random]
execute as @e[scores={slime_counter=6},tag=lvl6] run tag @s remove slime_summon_delay
execute as @e[scores={sli_spawn_delay=240,slime_counter=6},tag=!slime_summon_delay,tag=lvl6] run scoreboard players remove @s slime_counter 2