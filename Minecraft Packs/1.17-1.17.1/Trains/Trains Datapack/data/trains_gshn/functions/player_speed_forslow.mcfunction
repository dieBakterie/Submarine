scoreboard players set @e[type=minecraft:armor_stand,tag=rptrain_loco,tag=rptrain_linker,distance=..3] rptrain_tgtspeed 20
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_loco,tag=rptrain_linked,distance=..3] at @e[type=minecraft:armor_stand,tag=rptrain_angle,distance=..3] positioned ^ ^ ^10 run scoreboard players set @e[type=minecraft:armor_stand,tag=rptrain_loco,tag=rptrain_linker,distance=..2] rptrain_tgtspeed 20
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_loco,distance=..3] run tellraw @s {"text":"[Set Locomotive speed to slow forward]","color":"gold"}
scoreboard players set @e[type=minecraft:armor_stand,tag=rptrain_loco,tag=rptrain_linker,scores={rptrain_station=20..},distance=..3] rptrain_station 19
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_loco,tag=rptrain_linked,distance=..3] at @e[type=minecraft:armor_stand,tag=rptrain_angle,distance=..3] positioned ^ ^ ^10 run scoreboard players set @e[type=minecraft:armor_stand,tag=rptrain_loco,tag=rptrain_linker,scores={rptrain_station=20..},distance=..2] rptrain_station 19
