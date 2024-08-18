execute as @e[type=armor_stand,tag=vehicle,distance=..1,limit=1] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{"minecraft:custom_model_data":21}}]}
execute as @e[type=armor_stand,tag=vehicle,distance=..1,limit=1] run data merge entity @s {Tags:["vehicle","sub","sub2","color_green"]}
particle dust{color:[0.000,0.50,0.000],scale:2} ~ ~ ~ 1 1 1 0 50 normal
kill @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:green_dye",count:1}}]

