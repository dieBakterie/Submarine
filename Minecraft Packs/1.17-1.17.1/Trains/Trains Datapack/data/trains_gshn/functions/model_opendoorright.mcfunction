execute if entity @s[tag=rptrain_model_front,tag=rptrain_metroloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 14
execute if entity @s[tag=rptrain_model_back,tag=rptrain_metroloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 15
execute if entity @s[tag=rptrain_model_front,tag=rptrain_metrofakeloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 16
execute if entity @s[tag=rptrain_model_back,tag=rptrain_metrofakeloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 17
execute if entity @s[tag=rptrain_model_front,tag=rptrain_moderntramloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 26
execute if entity @s[tag=rptrain_model_back,tag=rptrain_moderntramloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 27
execute if entity @s[tag=rptrain_model_front,tag=rptrain_moderntramfakeloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 28
execute if entity @s[tag=rptrain_model_back,tag=rptrain_moderntramfakeloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 29
execute if entity @s[tag=rptrain_model_front,tag=rptrain_oldtramloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 20
execute if entity @s[tag=rptrain_model_back,tag=rptrain_oldtramloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 21
execute if entity @s[tag=rptrain_model_front,tag=rptrain_oldtramfakeloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 22
execute if entity @s[tag=rptrain_model_back,tag=rptrain_oldtramfakeloco] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 23
execute if entity @s[tag=rptrain_model_front,tag=rptrain_oldpasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 32
execute if entity @s[tag=rptrain_model_back,tag=rptrain_oldpasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 33
execute if entity @s[tag=rptrain_model_front,tag=rptrain_modernpasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 38
execute if entity @s[tag=rptrain_model_back,tag=rptrain_modernpasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 39
execute if entity @s[tag=rptrain_model_front,tag=rptrain_metropasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 44
execute if entity @s[tag=rptrain_model_back,tag=rptrain_metropasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 45
execute if entity @s[tag=rptrain_model_front,tag=rptrain_moderntrampasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 56
execute if entity @s[tag=rptrain_model_back,tag=rptrain_moderntrampasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 57
execute if entity @s[tag=rptrain_model_front,tag=rptrain_oldtrampasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 50
execute if entity @s[tag=rptrain_model_back,tag=rptrain_oldtrampasscar] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 51
execute if entity @s[tag=rptrain_metroloco] run playsound minecraft:custom.moderndoor ambient @a[distance=..15] ~ ~ ~ 1 1.5
execute if entity @s[tag=rptrain_metrofakeloco] run playsound minecraft:custom.moderndoor ambient @a[distance=..15] ~ ~ ~ 1 1.5
execute if entity @s[tag=rptrain_moderntramloco] run playsound minecraft:custom.moderndoor ambient @a[distance=..15] ~ ~ ~ 1 1.5
execute if entity @s[tag=rptrain_moderntramfakeloco] run playsound minecraft:custom.moderndoor ambient @a[distance=..15] ~ ~ ~ 1 1.5
execute if entity @s[tag=rptrain_modernpasscar] run playsound minecraft:custom.moderndoor ambient @a[distance=..15] ~ ~ ~ 1 1.5
execute if entity @s[tag=rptrain_metropasscar] run playsound minecraft:custom.moderndoor ambient @a[distance=..15] ~ ~ ~ 1 1.5
execute if entity @s[tag=rptrain_moderntrampasscar] run playsound minecraft:custom.moderndoor ambient @a[distance=..15] ~ ~ ~ 1 1.5
execute if entity @s[tag=rptrain_oldtramloco] run playsound minecraft:block.wooden_door.open ambient @a[distance=..15] ~ ~ ~ 1 1
execute if entity @s[tag=rptrain_oldtramfakeloco] run playsound minecraft:block.wooden_door.open ambient @a[distance=..15] ~ ~ ~ 1 1
execute if entity @s[tag=rptrain_oldpasscar] run playsound minecraft:block.wooden_door.open ambient @a[distance=..15] ~ ~ ~ 1 1
execute if entity @s[tag=rptrain_oldtrampasscar] run playsound minecraft:block.wooden_door.open ambient @a[distance=..15] ~ ~ ~ 1 1
tag @s add rptrain_openeddoorright
tag @s remove rptrain_openeddoorleft
tag @s remove rptrain_closeddoor
tag @s remove rptrain_opendoorright
