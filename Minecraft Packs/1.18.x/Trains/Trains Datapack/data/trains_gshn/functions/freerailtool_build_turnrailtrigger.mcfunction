execute if entity @s[tag=rptrain_freerailtool1] run summon minecraft:armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Invulnerable:1b,ShowArms:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,CustomNameVisible:0b,Tags:["rptrain_freerailtool","rptrain_spawn"],CustomName:'{"text":"rptrain_freerailbuilder"}'}
execute if entity @s[tag=rptrain_freerailtool2] run summon minecraft:armor_stand ~ ~ ~ {CustomNameVisible:1b,NoGravity:1b,Invulnerable:1b,ShowArms:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,CustomNameVisible:0b,Tags:["rptrain_freerailtool"],CustomName:'{"text":"rptrain_freerailend"}'}
execute as @e[type=minecraft:armor_stand,name=rptrain_freerailbuilder,tag=rptrain_spawn] at @s store result entity @s Rotation[0] float 1 run data get entity @e[type=minecraft:armor_stand,tag=rptrain_freerailtool1,distance=..1,limit=1] Rotation[0] 1
execute as @e[type=minecraft:armor_stand,name=rptrain_freerailbuilder,tag=rptrain_spawn] at @s store result entity @s Rotation[1] float 1 run data get entity @e[type=minecraft:armor_stand,tag=rptrain_freerailtool1,distance=..1,limit=1] Rotation[1] 1
execute as @e[type=minecraft:armor_stand,name=rptrain_freerailbuilder,tag=rptrain_spawn] store result score @s rptrain_rotation run data get entity @s Rotation[0] 1
execute as @e[type=minecraft:armor_stand,name=rptrain_freerailbuilder,tag=rptrain_spawn] if score @s rptrain_rotation matches ..-1 run scoreboard players add @s rptrain_rotation 360
execute as @e[type=minecraft:armor_stand,name=rptrain_freerailbuilder,tag=rptrain_spawn] if score @s rptrain_rotation matches 360.. run scoreboard players remove @s rptrain_rotation 360
tag @e[type=minecraft:armor_stand,tag=rptrain_freerailtool,tag=rptrain_spawn] remove rptrain_spawn
function trains_gshn:freerailtool_build_turn
