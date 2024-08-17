#fuse
execute as @e[tag=cobblepos] at @s if block ^ ^ ^ cobblestone as @s run tag @s remove air
execute as @e[tag=cobblepos,tag=!air] positioned as @s if block ^ ^ ^ cobblestone run tag @s add block

execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^2 ^-1 ^2 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^1 ^-1 ^2 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^ ^-1 ^2 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-1 ^-1 ^2 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-2 ^-1 ^2 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^2 ^-1 ^1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^1 ^-1 ^1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^ ^-1 ^1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-1 ^-1 ^1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-2 ^-1 ^1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^2 ^-1 ^ {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^1 ^-1 ^ {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-1 ^-1 ^ {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-2 ^-1 ^ {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^2 ^-1 ^-1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^1 ^-1 ^-1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^ ^-1 ^-1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-1 ^-1 ^-1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-2 ^-1 ^-1 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^2 ^-1 ^-2 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^1 ^-1 ^-2 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^ ^-1 ^-2 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-1 ^-1 ^-2 {Tags:["cobblepos"]}
execute positioned as @e[tag=cobble_minion,limit=1,sort=random] unless entity @e[tag=cobblepos,limit=24,distance=..3] run summon marker ^-2 ^-1 ^-2 {Tags:["cobblepos"]}
#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:cobblestone",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run tag @p add cobblestone.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:cobblestone",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}}] run kill @e[type=item,distance=..0.75]
execute as @a[tag=cobblestone.crafter_lvl1] run give @s player_head{display:{Name:"{\"text\":\"Cobblestone Minion\"}"},SkullOwner:{Id:[I;1085844244,-1446688870,-1996481596,2086116866],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjljMzhmZTRmYzk4YTI0ODA3OWNkMDRjNjViNmJmZjliNDUwMTdmMTY0NjBkYWIzYzM0YzE3YmZjM2VlMWQyZiJ9fX0="}]}}}
execute as @a[tag=cobblestone.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cobblestone remover"}'}}}]}] run tag @s remove cobblestone.crafter_lvl1
execute as @e[tag=cobblestone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cobblestone remover"}'}}}}] run tag @p add cobblestone.crafter_lvl1
execute as @e[tag=cobblestone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cobblestone remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace cobblestone
execute as @e[tag=cobblestone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"cobblestone remover"}'}}}}] run kill @e[type=!player,distance=..3]
#MineTimer reset
execute as @e[type=minecraft:armor_stand,tag=clayminionchest,scores={level=1}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=2}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=3}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=4}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=5}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=6}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=7}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=8}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=9}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=10}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=11}] at @s run scoreboard players set @e[scores={MineTimer=..},distance=..3] MineTimer 0
#scores
scoreboard objectives add clayminer dummy
scoreboard objectives add MineTimer dummy
