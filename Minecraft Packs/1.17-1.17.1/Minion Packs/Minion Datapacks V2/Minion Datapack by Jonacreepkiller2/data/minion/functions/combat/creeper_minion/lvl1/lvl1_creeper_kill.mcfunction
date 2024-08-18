execute positioned as @e[scores={creeper_counter=6},tag=lvl1] run loot insert ^1 ^ ^ loot minecraft:entities/creeper
execute positioned as @e[scores={creeper_counter=6},tag=lvl1] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:gunpowder"}}] as @s run kill @s
execute positioned as @e[scores={cre_spawn_delay=280,creeper_counter=6},tag=lvl1] at @s run kill @e[distance=0..3,tag=creeper,limit=1,sort=random]
execute as @e[scores={creeper_counter=6},tag=lvl1] run tag @s remove creeper_summon_delay
execute as @e[scores={cre_spawn_delay=280,creeper_counter=6},tag=lvl1,tag=!creeper_summon_delay] run scoreboard players remove @s creeper_counter 2