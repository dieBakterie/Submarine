execute positioned ^ ^ ^9.5 run tp @s ^ ^ ^-9.5 facing entity @e[type=armor_stand,tag=rptrain_linked,distance=..2,limit=1]
execute positioned ^ ^ ^9.5 run tp @s ^ ^ ^-9.5 facing entity @e[type=armor_stand,tag=rptrain_linker,distance=..2,limit=1]
execute at @e[type=armor_stand,tag=rptrain_bogie,distance=..2] run tp @s ~ ~ ~
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^ ^1 ^5 run tp @e[type=armor_stand,name=rptrain_base_middle,distance=..2] ~ ~ ~
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^ ^1 ^5 as @e[type=armor_stand,name=rptrain_model,tag=rptrain_model_front,distance=..2] store result entity @s Pose.Head[1] float 1 positioned ^ ^-1 ^-5 run data get entity @e[type=armor_stand,tag=rptrain_angle,distance=..2,limit=1] Rotation[0] 1
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^ ^1 ^5 as @e[type=armor_stand,name=rptrain_model,tag=rptrain_model_back,distance=..2] store result entity @s Pose.Head[1] float 1 positioned ^ ^-1 ^-5 run data get entity @e[type=armor_stand,tag=rptrain_angle,distance=..2,limit=1] Rotation[0] 1
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^ ^1 ^5 as @e[type=armor_stand,name=rptrain_model,tag=rptrain_model_front,distance=..2] store result entity @s Pose.Head[0] float 1 positioned ^ ^-1 ^-5 run data get entity @e[type=armor_stand,tag=rptrain_angle,distance=..2,limit=1] Rotation[1] 1
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^ ^1 ^5 as @e[type=armor_stand,name=rptrain_model,tag=rptrain_model_back,distance=..2] store result entity @s Pose.Head[0] float 1 positioned ^ ^-1 ^-5 run data get entity @e[type=armor_stand,tag=rptrain_angle,distance=..2,limit=1] Rotation[1] 1
execute positioned ^0 ^1.3 ^2 as @e[type=armor_stand,tag=rptrain_seat_mid,distance=..2,limit=1] run tp @s ~ ~ ~
execute positioned ^-1.2 ^0.8 ^2.6 as @e[type=armor_stand,tag=rptrain_seat_right,distance=..2,limit=1] run tp @s ~ ~ ~
execute positioned ^1.2 ^0.8 ^1 as @e[type=armor_stand,tag=rptrain_seat_left,distance=..2,limit=1] run tp @s ~ ~ ~
execute if entity @e[type=armor_stand,name=rptrain_base_front,distance=..1] positioned ^0 ^1.3 ^2 run tp @e[type=minecraft:pig,tag=rptrain_seat_mid,distance=..2] ~ ~ ~ ~180 ~
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^0 ^1.3 ^2 run tp @e[type=minecraft:pig,tag=rptrain_seat_mid,distance=..2] ~ ~ ~ ~0 ~
execute if entity @e[type=armor_stand,name=rptrain_base_front,distance=..1] positioned ^-1.2 ^0.8 ^2.6 run tp @e[type=minecraft:pig,tag=rptrain_seat_right,distance=..2] ~ ~ ~ ~180 ~
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^-1.2 ^0.8 ^2.6 run tp @e[type=minecraft:pig,tag=rptrain_seat_right,distance=..2] ~ ~ ~ ~0 ~
execute if entity @e[type=armor_stand,name=rptrain_base_front,distance=..1] positioned ^1.2 ^0.8 ^1 run tp @e[type=minecraft:pig,tag=rptrain_seat_left,distance=..2] ~ ~ ~ ~180 ~
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^1.2 ^0.8 ^1 run tp @e[type=minecraft:pig,tag=rptrain_seat_left,distance=..2] ~ ~ ~ ~0 ~
execute if entity @e[type=armor_stand,name=rptrain_base_front,distance=..1] positioned ^-1.2 ^0.8 ^2.6 run tp @e[type=minecraft:pig,tag=rptrain_offset90,tag=rptrain_seat_right,distance=..2] ~ ~ ~ ~-90 ~
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^-1.2 ^0.8 ^2.6 run tp @e[type=minecraft:pig,tag=rptrain_offset90,tag=rptrain_seat_right,distance=..2] ~ ~ ~ ~-90 ~
execute if entity @e[type=armor_stand,name=rptrain_base_front,distance=..1] positioned ^1.2 ^0.8 ^1 run tp @e[type=minecraft:pig,tag=rptrain_offset90,tag=rptrain_seat_left,distance=..2] ~ ~ ~ ~90 ~
execute if entity @e[type=armor_stand,name=rptrain_base_back,distance=..1] positioned ^1.2 ^0.8 ^1 run tp @e[type=minecraft:pig,tag=rptrain_offset90,tag=rptrain_seat_left,distance=..2] ~ ~ ~ ~90 ~
