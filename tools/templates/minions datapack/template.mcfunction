
execute as @e[type=minecraft:villager,tag=clayminion] at @s run tp ~ ~0.99 ~
execute as @e[type=minecraft:villager,tag=clayminion] store result score @s ypos run data get entity @s Pos[1]
execute as @e[type=minecraft:villager,tag=clayminion] store result entity @s Pos[1] double 1 run scoreboard players get @s ypos

#fuse
execute as @e[type=minecraft:armor_stand,tag=clayminionchest] at @s unless block ~ ~1 ~ chest run tag @s add stop
execute as @e[type=minecraft:armor_stand,tag=clayminionchest] at @s if block ~ ~1 ~ chest run tag @s remove stop
scoreboard players add @e[type=minecraft:chest_minecart,tag=clayminionchest] level 0
execute as @e[type=minecraft:villager,tag=clayminion] at @s as @e[type=minecraft:chest_minecart,distance=..0.5,scores={level=0}] run give @a[sort=nearest,limit=1] minecraft:villager_spawn_egg{EntityTag:{VillagerData:{level:1},Tags:["clayminion"]},display:{Name:'{"text":"Clay Minion I","color":"blue","italic":false}'}}
execute as @e[type=minecraft:villager,tag=clayminion] at @s as @e[type=minecraft:chest_minecart,distance=..0.5,scores={level=1}] run give @a[sort=nearest,limit=1] minecraft:villager_spawn_egg{EntityTag:{VillagerData:{level:2},Tags:["clayminion"]},display:{Name:'{"text":"Clay Minion II","color":"blue","italic":false}'}}
execute as @e[type=minecraft:villager,tag=clayminion] at @s as @e[type=minecraft:chest_minecart,distance=..0.5,scores={level=2}] run give @a[sort=nearest,limit=1] minecraft:villager_spawn_egg{EntityTag:{VillagerData:{level:3},Tags:["clayminion"]},display:{Name:'{"text":"Clay Minion III","color":"blue","italic":false}'}}
execute as @e[type=minecraft:villager,tag=clayminion] at @s as @e[type=minecraft:chest_minecart,distance=..0.5,scores={level=3}] run give @a[sort=nearest,limit=1] minecraft:villager_spawn_egg{EntityTag:{VillagerData:{level:4},Tags:["clayminion"]},display:{Name:'{"text":"Clay Minion IV","color":"blue","italic":false}'}}
execute as @e[type=minecraft:villager,tag=clayminion] at @s at @e[type=minecraft:chest_minecart,distance=..0.5] run tp @s ~ ~-600 ~
execute as @e[type=minecraft:villager] at @s at @e[type=minecraft:chest_minecart,distance=..0.5] run tag @s remove clayminion
execute as @a store result score @s clayamount run clear @s minecraft:clay_ball 0
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon armor_stand ~ ~ ~ {DisabledSlots:4144959,NoGravity:1b,ShowArms:1,Small:1,Invulnerable:1,NoBasePlate:1,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:9596948}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:9596948}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:9596948}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;1252695985,-2048111482,-1226544339,-177122751],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRhMjc5ZTFjYzdkOThmYWE0YjgwY2ZkNGVkMTg2YTFhOTRiNmMxMTkxMGM0ZjdiZDcyMWY4Y2Q0NGI0NTg4YSJ9fX0="}]}}}}],HandItems:[{id:"minecraft:diamond_shovel",Count:1b},{}],Tags:["clayminion"],CustomName:'{"text":"Clay Minion"}'}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~1 ~-1 ~ {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~2 ~-1 ~ {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-1 ~-1 ~ {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~1 ~-1 ~1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~1 ~-1 ~2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~2 ~-1 ~1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~2 ~-1 ~2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-2 ~-1 ~ {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-1 ~-1 ~-1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-1 ~-1 ~-2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-2 ~-1 ~-1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-2 ~-1 ~-2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-1 ~-1 ~1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-1 ~-1 ~2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-2 ~-1 ~1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~1 ~-1 ~-1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~2 ~-1 ~-1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~1 ~-1 ~-2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~2 ~-1 ~-2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~-2 ~-1 ~2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~ ~-1 ~-1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~ ~-1 ~-2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~ ~-1 ~1 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:area_effect_cloud ~ ~-1 ~2 {Radius:0f,Duration:1000000000,Tags:["claypos"]}
execute as @e[type=minecraft:villager,tag=clayminion] at @s run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["clayminionchestpos"],Passengers:[{id:"minecraft:chest_minecart",NoGravity:1b,Invulnerable:1b,CustomDisplayTile:1b,Tags:["clayminionchest"],DisplayState:{Name:"minecraft:air"},CustomName:'{"text":"Clay Minion"}',Items:[{Slot:4b,id:"minecraft:player_head",Count:1b},{Slot:22b,id:"minecraft:bedrock",Count:1b}]}]}
execute at @e[type=minecraft:villager,tag=clayminion,nbt={VillagerData:{level:1}}] run scoreboard players set @e[type=minecraft:chest_minecart,tag=clayminionchest,sort=nearest,limit=1] level 0
execute at @e[type=minecraft:villager,tag=clayminion,nbt={VillagerData:{level:2}}] run scoreboard players set @e[type=minecraft:chest_minecart,tag=clayminionchest,sort=nearest,limit=1] level 1
execute at @e[type=minecraft:villager,tag=clayminion,nbt={VillagerData:{level:3}}] run scoreboard players set @e[type=minecraft:chest_minecart,tag=clayminionchest,sort=nearest,limit=1] level 2
execute at @e[type=minecraft:villager,tag=clayminion,nbt={VillagerData:{level:4}}] run scoreboard players set @e[type=minecraft:chest_minecart,tag=clayminionchest,sort=nearest,limit=1] level 3
execute as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]}] at @s if entity @e[type=minecraft:area_effect_cloud,tag=claypos,sort=random,limit=1,distance=..3,tag=air] run tag @s add clayminionplace
execute as @e[type=minecraft:area_effect_cloud,tag=claypos] at @s unless block ~ ~ ~ minecraft:clay run tag @s remove block
execute as @e[type=minecraft:area_effect_cloud,tag=claypos] at @s unless block ~ ~ ~ minecraft:clay run tag @s remove air
execute as @e[type=minecraft:area_effect_cloud,tag=claypos] at @s unless block ~ ~ ~ minecraft:clay run tag @s add none
execute as @e[type=minecraft:area_effect_cloud,tag=claypos] at @s if block ~ ~ ~ minecraft:clay run tag @s add block
execute as @e[type=minecraft:area_effect_cloud,tag=claypos] at @s if block ~ ~ ~ minecraft:clay run tag @s remove none
execute as @e[type=minecraft:area_effect_cloud,tag=claypos] at @s if block ~ ~ ~ minecraft:clay run tag @s remove air
execute as @e[type=minecraft:area_effect_cloud,tag=claypos] at @s if block ~ ~ ~ minecraft:air run tag @s add air
execute as @e[type=minecraft:area_effect_cloud,tag=claypos] at @s if block ~ ~ ~ minecraft:air run tag @s remove block
execute as @e[type=minecraft:area_effect_cloud,tag=claypos] at @s if block ~ ~ ~ minecraft:air run tag @s remove none
execute as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]}] at @s at @e[type=minecraft:area_effect_cloud,tag=claypos,sort=random,limit=1,distance=..3,tag=!none] run tag @s add run
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,tag=!stop] unless score @s clayamount = 64 clayamount as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=5},tag=run] run data merge entity @s {Pose:{RightArm:[-50f,0f,-10f]}}
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,tag=!stop] unless score @s clayamount = 64 clayamount as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=10},tag=run] run data merge entity @s {Pose:{RightArm:[-30f,0f,-10f]}}
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,tag=!stop] unless score @s clayamount = 64 clayamount as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=15},tag=run] run data merge entity @s {Pose:{RightArm:[-20f,0f,-10f]}}
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,tag=!stop] as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=5},tag=clayminionplace,tag=run] run data merge entity @s {Pose:{RightArm:[-50f,0f,-10f]}}
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,tag=!stop] as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=10},tag=clayminionplace,tag=run] run data merge entity @s {Pose:{RightArm:[-30f,0f,-10f]}}
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,tag=!stop] as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=15},tag=clayminionplace,tag=run] run data merge entity @s {Pose:{RightArm:[-20f,0f,-10f]}}
execute as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},tag=run] at @s as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,sort=nearest] run data merge block ~ ~-1 ~ {TransferCooldown:1000}
execute as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=20},tag=clayminionplace,tag=run] at @s at @e[type=minecraft:area_effect_cloud,tag=claypos,sort=random,limit=1,distance=..3,tag=air] run fill ~ ~ ~ ~ ~ ~ minecraft:clay replace minecraft:air
execute as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=20},tag=!clayminionplace,tag=run] at @s as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,sort=nearest,tag=!stop] unless score @s clayamount = 64 clayamount at @e[type=minecraft:area_effect_cloud,tag=claypos,sort=random,limit=1,distance=..3,tag=block] run fill ~ ~ ~ ~ ~ ~ minecraft:air replace minecraft:clay
execute as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=20},tag=!clayminionplace,tag=run] at @s as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,sort=nearest,tag=!stop] unless score @s clayamount = 64 clayamount run fill ~ ~1 ~ ~ ~1 ~ minecraft:hopper{TransferCooldown:0,Items:[{Slot:0b,id:"minecraft:clay_ball",Count:2b}]} replace minecraft:air
execute as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},tag=run] at @s as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,sort=nearest] run data merge block ~ ~1 ~ {TransferCooldown:0}
execute as @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=22},tag=run] at @s as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,sort=nearest] unless score @s clayamount = 64 clayamount run fill ~ ~1 ~ ~ ~1 ~ minecraft:air replace minecraft:hopper
tag @e remove run
tag @e[type=minecraft:armor_stand,nbt={Tags:["clayminion"]},scores={MineTimer=22},tag=clayminionplace] remove clayminionplace
tp @e[type=minecraft:villager,tag=clayminion] ~ ~-600 ~
execute as @e[type=minecraft:villager,tag=clayminion] at @s run tag @s remove clayminion
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run summon area_effect_cloud ~1 ~-1 ~ {Tags:["del"],Radius:0f,Duration:1000}
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~2 ~-1 ~
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-1 ~-1 ~
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~1 ~-1 ~1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~1 ~-1 ~2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~2 ~-1 ~1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~2 ~-1 ~2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-2 ~-1 ~
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-1 ~-1 ~-1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-1 ~-1 ~-2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-2 ~-1 ~-1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-2 ~-1 ~-2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-1 ~-1 ~1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-1 ~-1 ~2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-2 ~-1 ~1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~1 ~-1 ~-1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~2 ~-1 ~-1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~1 ~-1 ~-2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~2 ~-1 ~-2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~-2 ~-1 ~2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~ ~-1 ~-1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~ ~-1 ~-2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~ ~-1 ~1
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run tp @e[type=area_effect_cloud,tag=del] ~ ~-1 ~2
execute as @e[tag=del] at @s run kill @e[type=minecraft:area_effect_cloud,limit=1,sort=nearest,tag=claypos]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["delmain"],Radius:0f,Duration:1000}
execute as @e[tag=delmain] at @s run kill @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=clayminion]
execute as @e[tag=delmain] at @s run kill @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=clayminionchestpos]
kill @e[type=minecraft:area_effect_cloud,tag=del]
kill @e[type=minecraft:area_effect_cloud,tag=delmain]
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]},scores={level=0}] at @s run give @p[sort=nearest] minecraft:villager_spawn_egg{EntityTag:{VillagerData:{level:1},Tags:["clayminion"]},display:{Name:'{"text":"Clay Minion I","color":"blue","italic":false}'}}
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]},scores={level=1}] at @s run give @p[sort=nearest] minecraft:villager_spawn_egg{EntityTag:{VillagerData:{level:2},Tags:["clayminion"]},display:{Name:'{"text":"Clay Minion II","color":"blue","italic":false}'}}
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]},scores={level=2}] at @s run give @p[sort=nearest] minecraft:villager_spawn_egg{EntityTag:{VillagerData:{level:3},Tags:["clayminion"]},display:{Name:'{"text":"Clay Minion III","color":"blue","italic":false}'}}
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]},scores={level=3}] at @s run give @p[sort=nearest] minecraft:villager_spawn_egg{EntityTag:{VillagerData:{level:4},Tags:["clayminion"]},display:{Name:'{"text":"Clay Minion IV","color":"blue","italic":false}'}}
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] run fill ~ ~1 ~ ~ ~1 ~ minecraft:air replace minecraft:hopper
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,limit=1,nbt=!{Items:[{Slot:22b,id:"minecraft:bedrock"}]}] run kill @s
#level up des Minions
execute as @e[scores={level=0},type=minecraft:chest_minecart,tag=clayminionchest,nbt=!{Items:[{Slot:4b,id:"minecraft:player_head"}]}] at @s at @p[scores={clayamount=160..},sort=nearest] run tag @s add levelup
execute as @e[scores={level=0},type=minecraft:chest_minecart,tag=clayminionchest,tag=levelup] run clear @p[scores={clayamount=160..},sort=nearest] minecraft:clay_ball 160
execute as @e[scores={level=0},type=minecraft:chest_minecart,tag=clayminionchest,tag=levelup] run scoreboard players add @s level 1
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=1},tag=levelup] container.4 minecraft:player_head{Tags:["no"],SkullOwner:{Id:[I;1252695985,-2048111482,-1226544339,-177122751],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRhMjc5ZTFjYzdkOThmYWE0YjgwY2ZkNGVkMTg2YTFhOTRiNmMxMTkxMGM0ZjdiZDcyMWY4Y2Q0NGI0NTg4YSJ9fX0="}]}},display:{Name:'{"text":"Clay Minion","color":"dark_blue"}',Lore:['{"text":" "}','{"text":"Click To Upgrade This Minion","color":"gray"}','{"text":"This minion will cost you.","color":"gray"}','{"text":"You will need 3200 clay.","color":"gray"}']}}
tag @e remove levelup
execute as @e[scores={level=1},type=minecraft:chest_minecart,tag=clayminionchest,nbt=!{Items:[{Slot:4b,id:"minecraft:player_head"}]}] at @s at @p[scores={clayamount=320..},sort=nearest] run tag @s add levelup
execute as @e[scores={level=1},type=minecraft:chest_minecart,tag=clayminionchest,tag=levelup] run clear @p[scores={clayamount=320..},sort=nearest] minecraft:clay_ball 320
execute as @e[scores={level=1},type=minecraft:chest_minecart,tag=clayminionchest,tag=levelup] run scoreboard players add @s level 1
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=2},tag=levelup] container.4 minecraft:player_head{Tags:["no"],SkullOwner:{Id:[I;1252695985,-2048111482,-1226544339,-177122751],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRhMjc5ZTFjYzdkOThmYWE0YjgwY2ZkNGVkMTg2YTFhOTRiNmMxMTkxMGM0ZjdiZDcyMWY4Y2Q0NGI0NTg4YSJ9fX0="}]}},display:{Name:'{"text":"Clay Minion","color":"dark_blue"}',Lore:['{"text":" "}','{"text":"Click To Upgrade This Minion","color":"gray"}','{"text":"This minion will cost you.","color":"gray"}','{"text":"You will need 320 clay.","color":"gray"}']}}
tag @e remove levelup
execute as @e[scores={level=2},type=minecraft:chest_minecart,tag=clayminionchest,nbt=!{Items:[{Slot:4b,id:"minecraft:player_head"}]}] at @s at @p[scores={clayamount=512..},sort=nearest] run tag @s add levelup
execute as @e[scores={level=2},type=minecraft:chest_minecart,tag=clayminionchest,tag=levelup] run clear @p[scores={clayamount=512..},sort=nearest] minecraft:clay_ball 512
execute as @e[scores={level=2},type=minecraft:chest_minecart,tag=clayminionchest,tag=levelup] run scoreboard players add @s level 1
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=3},tag=levelup] container.4 minecraft:player_head{Tags:["no"],SkullOwner:{Id:[I;1252695985,-2048111482,-1226544339,-177122751],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRhMjc5ZTFjYzdkOThmYWE0YjgwY2ZkNGVkMTg2YTFhOTRiNmMxMTkxMGM0ZjdiZDcyMWY4Y2Q0NGI0NTg4YSJ9fX0="}]}},display:{Name:'{"text":"Clay Minion","color":"dark_blue"}',Lore:['{"text":" "}','{"text":"Click To Upgrade This Minion","color":"gray"}','{"text":"This minion will cost you.","color":"gray"}','{"text":"You will need 320 clay.","color":"gray"}']}}
tag @e remove levelup
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=0}] at @s run scoreboard players set @e[scores={MineTimer=180..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=1}] at @s run scoreboard players set @e[scores={MineTimer=140..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=2}] at @s run scoreboard players set @e[scores={MineTimer=120..},distance=..3] MineTimer 0
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=3}] at @s run scoreboard players set @e[scores={MineTimer=100..},distance=..3] MineTimer 0
#inventar des Minions und der clayminionchest
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.0 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.1 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.2 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.3 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.5 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.6 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.7 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.8 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.9 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.17 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.18 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.19 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.20 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.21 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.22 minecraft:bedrock{display:{Name:'{"text":"Click to pick up this minion","color":"red","italic":false}'},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.23 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.24 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.25 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest] container.26 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"\"}"},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=..0}] container.13 minecraft:white_stained_glass_pane{display:{Name:'{"text":"This slot is locked","color":"gold","italic":false}',Lore:['{"text":" "}','{"text":"This Slot will be ","color":"gray","italic":false}','{"text":"unlocked at level 2","color":"gray","italic":false}']},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=..1}] container.14 minecraft:white_stained_glass_pane{display:{Name:'{"text":"This slot is locked","color":"gold","italic":false}',Lore:['{"text":" "}','{"text":"This Slot will be ","color":"gray","italic":false}','{"text":"unlocked at level 3","color":"gray","italic":false}']},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=..2}] container.15 minecraft:white_stained_glass_pane{display:{Name:'{"text":"This slot is locked","color":"gold","italic":false}',Lore:['{"text":" "}','{"text":"This Slot will be ","color":"gray","italic":false}','{"text":"unlocked at level 4","color":"gray","italic":false}']},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=..2}] container.16 minecraft:white_stained_glass_pane{display:{Name:'{"text":"This slot is locked","color":"gold","italic":false}',Lore:['{"text":" "}','{"text":"This Slot will be ","color":"gray","italic":false}','{"text":"unlocked at level 4","color":"gray","italic":false}']},Tags:["no"]}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=1..},nbt={Items:[{Slot:13b,id:"minecraft:white_stained_glass_pane"}]}] container.13 air
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=2..},nbt={Items:[{Slot:14b,id:"minecraft:white_stained_glass_pane"}]}] container.14 air
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=3..},nbt={Items:[{Slot:15b,id:"minecraft:white_stained_glass_pane"}]}] container.15 air
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=3..},nbt={Items:[{Slot:16b,id:"minecraft:white_stained_glass_pane"}]}] container.16 air
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=0}] container.4 minecraft:player_head{display:{Name:'{"text":"Clay Minion I","color":"blue","italic":false}',Lore:['{"text":" "}','{"text":"Click To Upgrade This Minion","color":"gray","italic":false}','{"text":"This minion will cost you.","color":"gray","italic":false}','{"text":"You will need 160 clay.","color":"gray","italic":false}']},Tags:["no"],SkullOwner:{Id:[I;1252695985,-2048111482,-1226544339,-177122751],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRhMjc5ZTFjYzdkOThmYWE0YjgwY2ZkNGVkMTg2YTFhOTRiNmMxMTkxMGM0ZjdiZDcyMWY4Y2Q0NGI0NTg4YSJ9fX0="}]}}}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=1}] container.4 minecraft:player_head{display:{Name:'{"text":"Clay Minion II","color":"blue","italic":false}',Lore:['{"text":" "}','{"text":"Click To Upgrade This Minion","color":"gray","italic":false}','{"text":"This minion will cost you.","color":"gray","italic":false}','{"text":"You will need 320 clay.","color":"gray","italic":false}']},Tags:["no"],SkullOwner:{Id:[I;1252695985,-2048111482,-1226544339,-177122751],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRhMjc5ZTFjYzdkOThmYWE0YjgwY2ZkNGVkMTg2YTFhOTRiNmMxMTkxMGM0ZjdiZDcyMWY4Y2Q0NGI0NTg4YSJ9fX0="}]}}}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=2}] container.4 minecraft:player_head{display:{Name:'{"text":"Clay Minion III","color":"blue","italic":false}',Lore:['{"text":" "}','{"text":"Click To Upgrade This Minion","color":"gray","italic":false}','{"text":"This minion will cost you.","color":"gray","italic":false}','{"text":"You will need 512 clay.","color":"gray","italic":false}']},Tags:["no"],SkullOwner:{Id:[I;1252695985,-2048111482,-1226544339,-177122751],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRhMjc5ZTFjYzdkOThmYWE0YjgwY2ZkNGVkMTg2YTFhOTRiNmMxMTkxMGM0ZjdiZDcyMWY4Y2Q0NGI0NTg4YSJ9fX0="}]}}}
replaceitem entity @e[type=minecraft:chest_minecart,tag=clayminionchest,scores={level=3}] container.4 minecraft:player_head{Tags:["no"],display:{Name:'{"text":"Clay Minion IV","color":"blue","italic":false}',Lore:['{"text":" "}','{"text":"This is the maxed level of","color":"gray","italic":false}','{"text":"this minion you can\'t upgrade","color":"gray","italic":false}','{"text":"it any more.","color":"gray","italic":false}']},SkullOwner:{Id:[I;1252695985,-2048111482,-1226544339,-177122751],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRhMjc5ZTFjYzdkOThmYWE0YjgwY2ZkNGVkMTg2YTFhOTRiNmMxMTkxMGM0ZjdiZDcyMWY4Y2Q0NGI0NTg4YSJ9fX0="}]}}}
#scoreboards
scoreboard objectives add clayminer dummy
scoreboard objectives add craftclay trigger
scoreboard players enable @a craftclay
#crafting
give @a[scores={clayminer=1..}] minecraft:villager_spawn_egg{EntityTag:{VillagerData:{level:1},Tags:["clayminion"]},display:{Name:'{"text":"Clay Minion I","color":"blue","italic":false}'}}
scoreboard players add @a clayminer 0
scoreboard players set @a clayminer 0
scoreboard objectives add clayamount dummy
execute as @e[type=minecraft:chest_minecart,tag=clayminionchest] store result score @s clayamount run data get entity @s Items[16].Count
scoreboard players set 64 clayamount 64
kill @e[type=item,nbt={Item:{tag:{SkullOwner:{Id:[I;1252695985,-2048111482,-1226544339,-177122751],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRhMjc5ZTFjYzdkOThmYWE0YjgwY2ZkNGVkMTg2YTFhOTRiNmMxMTkxMGM0ZjdiZDcyMWY4Y2Q0NGI0NTg4YSJ9fX0="}]}}}}}]
scoreboard players add @a craftclay 0
scoreboard objectives add shovelamount dummy
execute as @a store result score @s shovelamount run clear @s minecraft:wooden_shovel 0
tellraw @p[scores={craftclay=1..}] ["\n"]
tellraw @p[scores={craftclay=1..}] ["\n"]
tellraw @p[scores={craftclay=1..}] ["\n",{"text":"64x","color":"gray"},{"text":"clay","color":"white","hoverEvent":{"action":"show_text","value":[{"text":"clay","color":"white"}]}},{"text":"","color":"gray"},{"text":"","color":"white","hoverEvent":{"action":"show_text","value":[{"text":"","color":"white"}]}},{"text":" clay 1x","color":"gray"},{"text":"Wooden_shovel","color":"white","hoverEvent":{"action":"show_text","value":[{"text":"Wooden_shovel","color":"white"}]}},{"text":" -> 1x ","color":"gray"},{"text":"Clay Minion","color":"blue","clickEvent":{"action":"run_command","value":"/execute at @s[scores={clayamount=64..,shovelamount=1..}] run tag @s add claycraft"},"hoverEvent":{"action":"show_text","value":[{"text":"Click to craft","color":"white"}]}}]
tellraw @p[scores={craftclay=1..}] ["\n"]
clear @a[tag=claycraft] minecraft:clay_ball 64
execute as @a[tag=claycraft] run scoreboard players set @s clayminer 1
clear @a[tag=claycraft] minecraft:wooden_shovel 1
tag @a remove claycraft
scoreboard players set @a craftclay 0
