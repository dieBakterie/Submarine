#fuse
execute as @e[tag=cow_minion,tag=lvl1] at @s as @s unless entity @e[tag=cow,distance=0..3] run scoreboard players set @s cow_counter 0
execute as @a[scores={cow_killer=1}] if entity @e[tag=cow,limit=4] run scoreboard players remove @e[tag=cow_minion,tag=lvl1,limit=1,sort=nearest] cow_counter 1
execute as @a[scores={cow_killer=1}] if entity @e[tag=cow,limit=4] run scoreboard players set @s cow_killer 0

#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:beef",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run tag @p add cow.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:beef",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=cow.crafter_lvl1] run 
execute as @a[tag=cow.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"cow remover"}'}} 1
execute as @a[tag=cow.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cow remover"}'}}}]}] run tag @s remove cow.crafter_lvl1
execute as @e[tag=cow_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cow remover"}'}}}}] run tag @p add cow.crafter_lvl1
execute as @e[tag=cow_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cow remover"}'}}}}] run kill @e[type=!player,distance=..4]

#main
scoreboard players add @e[tag=cow_minion,tag=lvl1] cow_spawn_delay 1
execute positioned as @e[scores={cow_spawn_delay=260,cow_counter=0..5},tag=lvl1] unless entity @e[tag=cow_summon_delay] run summon minecraft:cow ^ ^1 ^1 {PersistenceRequired:1b,Tags:["cow"]}
execute as @e[scores={cow_spawn_delay=260},tag=lvl1] as @s run scoreboard players add @s cow_counter 1
execute as @e[scores={cow_counter=5,cow_spawn_delay=260},tag=lvl1] as @s run tag @s add cow_summon_delay
execute positioned as @e[scores={cow_counter=6},tag=lvl1] at @s if entity @e[distance=0..3,tag=cow_summon_delay,tag=lvl1] run function dp_by_j:farming/cow_minion/lvl1/lvl1_cow_kill
execute as @e[scores={cow_spawn_delay=260,cow_counter=1..},tag=lvl1] as @s run scoreboard players set @s cow_spawn_delay 0