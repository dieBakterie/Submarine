scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_gray,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:17}}]}
execute as @s[tag=subforward,tag=color_gray,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:18}}]}
execute as @s[tag=subforward,tag=color_gray,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:19}}]}
execute as @s[tag=subforward,tag=color_gray,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:20}}]}
execute as @s[tag=subbackwards,tag=color_gray,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:20}}]}
execute as @s[tag=subbackwards,tag=color_gray,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:19}}]}
execute as @s[tag=subbackwards,tag=color_gray,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:18}}]}
execute as @s[tag=subbackwards,tag=color_gray,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:17}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

