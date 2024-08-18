#// Description: This function is responsible for animating the red submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_red,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:53}}]}
execute as @s[tag=subforward,tag=color_red,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:54}}]}
execute as @s[tag=subforward,tag=color_red,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:55}}]}
execute as @s[tag=subforward,tag=color_red,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:56}}]}
execute as @s[tag=subbackwards,tag=color_red,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:56}}]}
execute as @s[tag=subbackwards,tag=color_red,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:55}}]}
execute as @s[tag=subbackwards,tag=color_red,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:54}}]}
execute as @s[tag=subbackwards,tag=color_red,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:53}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

