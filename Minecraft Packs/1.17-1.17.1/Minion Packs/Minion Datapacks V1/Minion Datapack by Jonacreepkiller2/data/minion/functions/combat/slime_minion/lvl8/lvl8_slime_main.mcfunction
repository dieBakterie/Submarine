#fuse
execute as @e[tag=slime_minion,tag=lvl8] at @s as @s unless entity @e[tag=slime,distance=0..3] run scoreboard players set @s slime_counter 0
execute as @a[scores={slime_killer=1}] if entity @e[tag=slime,limit=4] run scoreboard players remove @e[tag=slime_minion,tag=lvl8,limit=1,sort=nearest] slime_counter 1
execute as @a[scores={slime_killer=1}] if entity @e[tag=slime,limit=4] run scoreboard players set @s slime_killer 0

#get minion
execute as @e[tag=slime_minion,tag=lvl8] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"slime remover"}'}}}}] run tag @p add slime.crafter_lvl8
execute as @e[tag=slime_minion,tag=lvl8] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"slime remover"}'}}}}] run kill @e[type=!player,distance=..4]
execute as @a[tag=slime.crafter_lvl8] run
execute as @a[tag=slime.crafter_lvl8] run give @s tripwire_hook{display:{Name:'{"text":"slime remover"}'}}
execute as @a[tag=slime.crafter_lvl8,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"slime remover"}'}}}]}] run tag @s remove slime.crafter_lvl8

#main
scoreboard players add @e[tag=slime_minion,tag=lvl8] sli_spawn_delay 1
execute positioned as @e[scores={sli_spawn_delay=240,slime_counter=0..5},tag=lvl8] unless entity @e[tag=slime_summon_delay,tag=lvl8] run summon minecraft:slime ^ ^1 ^1 {PersistenceRequired:1b,Tags:["slime"]}
execute as @e[scores={sli_spawn_delay=240},tag=lvl8] as @s run scoreboard players add @s slime_counter 1
execute as @e[scores={slime_counter=5,sli_spawn_delay=240},tag=lvl8] as @s run tag @s add slime_summon_delay
execute as @e[scores={slime_counter=6},tag=lvl8] if entity @e[tag=slime_summon_delay,tag=lvl8] as @s run function dp_by_j:combat/lvl8/lvl8_slime_kill
execute as @e[scores={sli_spawn_delay=240},tag=lvl8] run scoreboard players set @s sli_spawn_delay 0