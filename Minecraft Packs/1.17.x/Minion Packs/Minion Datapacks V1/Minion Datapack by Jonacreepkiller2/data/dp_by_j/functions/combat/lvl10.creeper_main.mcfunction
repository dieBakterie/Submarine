#fuse
execute as @e[tag=creeper_minion,tag=lvl10] at @s as @s unless entity @e[tag=creeper,distance=0..3] run scoreboard players set @s creeper_counter 0
execute as @a[scores={creeper_killer=1}] if entity @e[tag=creeper,limit=4] run scoreboard players remove @e[tag=creeper_minion,tag=lvl10,limit=1,sort=nearest] creeper_counter 1
execute as @a[scores={creeper_killer=1}] if entity @e[tag=creeper,limit=4] run scoreboard players set @s creeper_killer 0

#get minion
execute as @e[tag=creeper_minion,tag=lvl10] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"creeper remover"}'}}}}] run tag @p add creeper.crafter_lvl10
execute as @e[tag=creeper_minion,tag=lvl10] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"creeper remover"}'}}}}] run kill @e[type=!player,distance=..4]
execute as @a[tag=creeper.crafter_lvl10] run 
execute as @a[tag=creeper.crafter_lvl10] run give @s tripwire_hook{display:{Name:'{"text":"creeper remover"}'}}
execute as @a[tag=creeper.crafter_lvl10,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"creeper remover"}'}}}]}] run tag @s remove creeper.crafter_lvl10

#main
scoreboard players add @e[tag=creeper_minion,tag=lvl10] cre_spawn_delay 1
execute positioned as @e[scores={cre_spawn_delay=280,creeper_counter=0..5},tag=lvl10] unless entity @e[tag=creeper_summon_delay,tag=lvl10] run summon minecraft:creeper ^ ^1 ^1 {PersistenceRequired:1b,Tags:["creeper"]}
execute as @e[scores={cre_spawn_delay=280},tag=lvl10] run scoreboard players add @s creeper_counter 1
execute as @e[scores={creeper_counter=5,cre_spawn_delay=280},tag=lvl10] run tag @s add creeper_summon_delay
execute as @e[scores={creeper_counter=6},tag=lvl10] if entity @e[tag=creeper_summon_delay,tag=lvl10] run function dp_by_j:combat/lvl10.creeper_kill
execute as @e[scores={cre_spawn_delay=280},tag=lvl10] run scoreboard players set @s cre_spawn_delay 0