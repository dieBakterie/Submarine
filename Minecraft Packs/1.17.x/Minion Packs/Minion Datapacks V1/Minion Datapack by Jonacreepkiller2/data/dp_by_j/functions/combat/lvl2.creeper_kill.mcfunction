execute positioned as @e[scores={creeper_counter=6},tag=lvl2] run loot insert ^1 ^ ^ loot minecraft:entities/creeper
execute positioned as @e[scores={cow_counter=6},tag=lvl2] at @s if entity @e[type=item,distance=0..3,nbt={Item:{id:"minecraft:gunpowder"}},tag=lvl2] as @s run kill @s
execute as @e[scores={cre_spawn_delay=280,creeper_counter=6},tag=lvl2] run kill @e[tag=creeper,limit=1,sort=random]
execute as @e[scores={creeper_counter=6},tag=lvl2] run tag @s remove creeper_summon_delay
execute as @e[scores={cre_spawn_delay=280,creeper_counter=6},tag=!creeper_summon_delay,tag=lvl2] run scoreboard players remove @s creeper_counter 2