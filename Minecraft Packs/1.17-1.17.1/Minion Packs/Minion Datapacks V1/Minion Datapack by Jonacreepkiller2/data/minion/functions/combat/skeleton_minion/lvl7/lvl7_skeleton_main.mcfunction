#fuse
execute as @e[tag=skeleton_minion,tag=lvl7] at @s as @s unless entity @e[tag=skeleton,distance=0..3] run scoreboard players set @s skeleton_counter 0
execute as @a[scores={skeleton_killer=1}] if entity @e[tag=skeleton,limit=4] run scoreboard players remove @e[tag=skeleton_minion,tag=lvl7,limit=1,sort=nearest] skeleton_counter 1
execute as @a[scores={skeleton_killer=1}] if entity @e[tag=skeleton,limit=4] run scoreboard players set @s skeleton_killer 0

#get minion
execute as @e[tag=skeleton_minion,tag=lvl7] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"skeleton remover"}'}}}}] run tag @p add skeleton.crafter_lvl7
execute as @e[tag=skeleton_minion,tag=lvl7] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"skeleton remover"}'}}}}] run kill @e[type=!player,distance=..4]
execute as @a[tag=skeleton.crafter_lvl7] run
execute as @a[tag=skeleton.crafter_lvl7] run give @s tripwire_hook{display:{Name:'{"text":"skeleton remover"}'}}
execute as @a[tag=skeleton.crafter_lvl7,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"skeleton remover"}'}}}]}] run tag @s remove skeleton.crafter_lvl7

#main
scoreboard players add @e[tag=skeleton_minion,tag=lvl7] skel_spawn_delay 1
execute positioned as @e[scores={skel_spawn_delay=260,skeleton_counter=0..5},tag=lvl7] unless entity @e[tag=skeleton_summon_delay,tag=lvl7] run summon minecraft:skeleton ^ ^1 ^1 {PersistenceRequired:1b,Tags:["skeleton"]}
execute as @e[scores={skel_spawn_delay=260},tag=lvl7] run scoreboard players add @s skeleton_counter 1
execute as @e[scores={skeleton_counter=5,skeleton_spawn_delay=260},tag=lvl7] run tag @s add skeleton_summon_delay
execute as @e[scores={skeleton_counter=6},tag=lvl7] if entity @e[tag=skeleton_summon_delay,tag=lvl7] run function dp_by_j:combat/lvl7/lvl7_skeleton_kill
execute as @e[scores={skel_spawn_delay=260},tag=lvl7] run scoreboard players set @s skel_spawn_delay 0