#fuse
execute as @e[tag=slime_minion,tag=lvl1] at @s as @s unless entity @e[tag=slime,distance=0..3] run scoreboard players set @s slime_counter 0
execute as @a[scores={slime_killer=1}] if entity @e[tag=slime,limit=4] run scoreboard players remove @e[tag=slime_minion,limit=1,sort=nearest] slime_counter 1
execute as @a[scores={slime_killer=1}] if entity @e[tag=slime,limit=4] run scoreboard players set @s slime_killer 0

#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:slime_ball",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run tag @p add slime.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:slime_ball",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=slime.crafter_lvl1] run 
execute as @a[tag=slime.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"slime remover"}'}}
execute as @a[tag=slime.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"slime remover"}'}}}]}] run tag @s remove slime.crafter_lvl1
execute as @e[tag=slime_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"slime remover"}'}}}}] run tag @p add slime.crafter_lvl1
execute as @e[tag=slime_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"slime remover"}'}}}}] run kill @e[type=!player,distance=..3.5]

#main
scoreboard players add @e[tag=slime_minion,tag=lvl1] sli_spawn_delay 1
execute positioned as @e[scores={sli_spawn_delay=240,slime_counter=0..5},tag=lvl1] unless entity @e[tag=slime_summon_delay,tag=lvl1] run summon minecraft:slime ^ ^1 ^1 {PersistenceRequired:1b,Tags:["slime"]}
execute as @e[scores={sli_spawn_delay=240},tag=lvl1] as @s run scoreboard players add @s slime_counter 1
execute as @e[scores={slime_counter=5,sli_spawn_delay=240},tag=lvl1] as @s run tag @s add slime_summon_delay
execute as @e[scores={slime_counter=6},tag=lvl1] if entity @e[tag=slime_summon_delay,tag=lvl1] as @s run function dp_by_j:combat/lvl1.slime_kill
execute as @e[scores={sli_spawn_delay=240},tag=lvl1] run scoreboard players set @s sli_spawn_delay 0