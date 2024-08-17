#fuse
execute as @e[tag=emerald_obfuscated] positioned as @s unless block ^ ^ ^ emerald_ore run tag @s remove emerald_obfuscated
execute as @e[tag=emerald.gen,tag=!emerald_obfuscated] positioned as @s if block ^ ^ ^ emerald_ore run tag @s add emerald_obfuscated
execute as @e[tag=emerald_minion,tag=lvl1] at @s if entity @e[distance=..3,tag=emerald.gen,limit=24] run tag @s add emerald.gen_true


#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:emerald",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @p add emerald.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:emerald",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=emerald.crafter_lvl1] run
execute as @a[tag=emerald.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"emerald remover"}'}}
execute as @a[tag=emerald.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}]}] run tag @p remove emerald.crafter_lvl1
execute as @e[tag=emerald_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run tag @p add emerald.crafter_lvl1
execute as @e[tag=emerald_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace emerald_ore
execute as @e[tag=emerald_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run kill @e[type=!player,distance=..3]

#main
scoreboard players add @e[tag=emerald_minion,tag=lvl1] eme_gen_delay 1
execute as @e[scores={eme_gen_delay=280},tag=lvl1] at @s positioned as @e[distance=..3,tag=!emerald_obfuscated,tag=emerald.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ emerald_ore
execute as @e[scores={eme_gen_delay=280},tag=lvl1] run scoreboard players add @s eme_ore_counter 1
execute as @e[scores={eme_ore_counter=24},tag=lvl1] at @s run tag @e[distance=..3,tag=emerald_obfuscated,limit=1,sort=random] add emerald_selected
execute as @e[scores={eme_ore_counter=24},tag=lvl1] if entity @e[tag=emerald_selected] run function dp_by_j:mining/lvl1.emerald_mining
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=1}] at @s run scoreboard players set @e[scores={MineTimer=280..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=2}] at @s run scoreboard players set @e[scores={MineTimer=280..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=3}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=4}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=5}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=6}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=7}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=8}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=9}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=10}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:marker,tag=emeraldminion,scores={level=11}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
scoreboard objectives add emeraldminer dummy
scoreboard objectives add craftemerald trigger
scoreboard players enable @a craftemerald
give @a[scores={emeraldminer=1..}] minecraft:villager_spawn_egg{EntityTag:{Tags:["emeraldminion","level1"]},display:{Name:'{"text":"emerald Minion I","color":"blue","italic":false}'}}
scoreboard players add @a emeraldminer 0
scoreboard players set @a emeraldminer 0
scoreboard objectives add emeraldamount dummy
execute as @e[type=marker,tag=emeraldminionchest] store result score @s emeraldamount run data get block  Items[16].Count
execute as @a[tag=emeraldcraft] run scoreboard players set @s emeraldminer 1
execute as @a[tag=emeraldcraft] at @s run as @e[type=item,nbt=nbt={Item:{id:"minecraft:wooden_shovel",Count:1b}},distance=..3,limit=1,sort=nearest] run kill @e[type=item,distance=..0.75]
tag @a remove emeraldcraft
scoreboard players set @a craftemerald 0
