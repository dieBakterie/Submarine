execute as @e[type=armor_stand,tag=vehicle,distance=..1,limit=1] run data merge entity @s {ArmorItems:[{},{},{},{id:paper,count:1,components:{item_model:"submarine:submarines/light_blue/light_blue_submarine_1"}}]}
execute as @e[type=armor_stand,tag=vehicle,distance=..1,limit=1] run data merge entity @s {Tags:["vehicle","sub","sub2","color_light_blue"]}
particle dust{color:[0.678,0.847,0.902],scale:2} ~ ~ ~ 1 1 1 0 50 normal
kill @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:light_blue_dye",count:1}}]

