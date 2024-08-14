scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_brown,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:9}}]}
execute as @s[tag=subforward,tag=color_brown,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:10}}]}
execute as @s[tag=subforward,tag=color_brown,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:11}}]}
execute as @s[tag=subforward,tag=color_brown,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:12}}]}
execute as @s[tag=subbackwards,tag=color_brown,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:12}}]}
execute as @s[tag=subbackwards,tag=color_brown,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:11}}]}
execute as @s[tag=subbackwards,tag=color_brown,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:10}}]}
execute as @s[tag=subbackwards,tag=color_brown,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:9}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

