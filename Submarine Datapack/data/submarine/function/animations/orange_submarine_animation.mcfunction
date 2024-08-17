#// Description: This function is responsible for animating the orange submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_orange,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:41}}]}
execute as @s[tag=subforward,tag=color_orange,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:42}}]}
execute as @s[tag=subforward,tag=color_orange,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:43}}]}
execute as @s[tag=subforward,tag=color_orange,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:44}}]}
execute as @s[tag=subbackwards,tag=color_orange,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:44}}]}
execute as @s[tag=subbackwards,tag=color_orange,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:43}}]}
execute as @s[tag=subbackwards,tag=color_orange,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:42}}]}
execute as @s[tag=subbackwards,tag=color_orange,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:41}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

