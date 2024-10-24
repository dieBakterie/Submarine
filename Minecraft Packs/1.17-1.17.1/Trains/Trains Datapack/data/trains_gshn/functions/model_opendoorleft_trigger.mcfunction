execute if entity @s[tag=rptrain_linker] at @e[type=minecraft:armor_stand,tag=rptrain_angle,distance=..2] positioned ^ ^ ^5 run tag @e[type=armor_stand,name=rptrain_model,distance=..2] add rptrain_opendoorleft
execute if entity @s[tag=rptrain_linked] positioned ^ ^ ^3.5 run tag @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=!rptrain_loco,distance=..3,limit=1] add rptrain_opendoorleft
execute if entity @s[tag=rptrain_linker,tag=rptrain_loco] positioned ^ ^ ^3.5 run tag @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=!rptrain_loco,distance=..3,limit=1] add rptrain_opendoorleft
execute if entity @s[tag=rptrain_linker] at @e[type=minecraft:armor_stand,tag=rptrain_angle,distance=..2] positioned ^ ^ ^10 run tag @e[type=armor_stand,tag=rptrain_bogie,distance=..2] add rptrain_opendoorleft
execute if entity @e[type=armor_stand,name=rptrain_model,tag=rptrain_opendoorleft,tag=!rptrain_openeddoorleft] as @e[type=armor_stand,name=rptrain_model,tag=rptrain_opendoorleft,tag=!rptrain_openeddoorleft] at @s run function trains_gshn:model_opendoorleft
tag @s remove rptrain_opendoorleft
