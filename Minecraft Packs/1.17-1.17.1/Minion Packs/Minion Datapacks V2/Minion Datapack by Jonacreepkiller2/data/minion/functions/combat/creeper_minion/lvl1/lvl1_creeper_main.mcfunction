#fuse
execute as @e[tag=creeper_minion,tag=lvl1] at @s as @s unless entity @e[tag=creeper,distance=0..3] run scoreboard players set @s creeper_counter 0
execute as @a[scores={creeper_killer=1}] if entity @e[tag=creeper,limit=4] run scoreboard players remove @e[tag=creeper_minion,tag=lvl1,limit=1,sort=nearest] creeper_counter 1
execute as @a[scores={creeper_killer=1}] if entity @e[tag=creeper,limit=4] run scoreboard players set @s creeper_killer 0

#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:gunpowder",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run tag @p add creeper.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:gunpowder",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=creeper.crafter_lvl1] run 
execute as @a[tag=creeper.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"creeper remover"}'}}
execute as @a[tag=creeper.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"creeper remover"}'}}}]}] run tag @s remove creeper.crafter_lvl1
execute as @e[tag=creeper_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"creeper remover"}'}}}}] run tag @p add creeper.crafter_lvl1
execute as @e[tag=creeper_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"creeper remover"}'}}}}] run kill @e[type=!player,distance=..4]

#main
scoreboard players add @e[tag=creeper_minion,tag=lvl1] cre_spawn_delay 1
execute positioned as @e[scores={cre_spawn_delay=280,creeper_counter=0..5},tag=lvl1] at @s unless entity @e[distance=0..3,tag=creeper_summon_delay,tag=lvl1] run summon minecraft:creeper ^ ^1 ^1 {PersistenceRequired:1b,Tags:["creeper"]}
execute as @e[scores={cre_spawn_delay=280},tag=lvl1] run scoreboard players add @s creeper_counter 1
execute as @e[scores={creeper_counter=5,cre_spawn_delay=280},tag=lvl1] run tag @s add creeper_summon_delay
execute as @e[scores={creeper_counter=6},tag=lvl1] if entity @e[tag=creeper_summon_delay,tag=lvl1] run function dp_by_j:combat/creeper_minion/lvl1/lvl1_creeper_kill
execute as @e[scores={cre_spawn_delay=280},tag=lvl1] run scoreboard players set @s cre_spawn_delay 0