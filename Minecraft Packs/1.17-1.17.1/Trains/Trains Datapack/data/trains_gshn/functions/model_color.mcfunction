execute as @e[type=armor_stand,name=rptrain_model,distance=..5] store result entity @s ArmorItems[3].tag.display.color int 1 run scoreboard players get @p rptrain_color
execute as @e[type=armor_stand,tag=rptrain_bogiecolor,distance=..5] store result entity @s ArmorItems[3].tag.display.color int 1 run scoreboard players get @p rptrain_color
execute if entity @s[scores={rptrain_color=3158064}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.188235294117647 0.188235294117647 0.188235294117647 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=133}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0 0 0.52156862745098 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=16395}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0 0.250980392156863 0.0431372549019608 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=21094}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0 0.32156862745098 0.4 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=8193542}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.490196078431373 0.0235294117647059 0.0235294117647059 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=5898339}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.352941176470588 0 0.388235294117647 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=13395726}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.8 0.403921568627451 0.0549019607843137 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=11184810}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.666666666666667 0.666666666666667 0.666666666666667 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=6052956}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.36078431372549 0.36078431372549 0.36078431372549 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=2053119}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.12156862745098 0.325490196078431 1 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=6529357}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.388235294117647 0.631372549019608 0.301960784313725 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=315857}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.0156862745098039 0.819607843137255 0.819607843137255 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=12721983}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.76078431372549 0.12156862745098 0.247058823529412 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=11753391}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.701960784313725 0.341176470588235 0.686274509803922 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=14726144}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.87843137254902 0.705882352941177 0 3 ~ ~ ~ 2 2 2 0 100
execute if entity @s[scores={rptrain_color=14737632}] at @e[type=armor_stand,name=rptrain_model,distance=..5] run particle minecraft:dust 0.87843137254902 0.87843137254902 0.87843137254902 3 ~ ~ ~ 2 2 2 0 100
scoreboard players reset @s rptrain_color
