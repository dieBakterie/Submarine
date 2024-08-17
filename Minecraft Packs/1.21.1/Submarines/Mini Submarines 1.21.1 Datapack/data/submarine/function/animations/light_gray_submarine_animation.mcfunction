#// Description: This function is responsible for animating the light_gray submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_light_gray,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:29}}]}
execute as @s[tag=subforward,tag=color_light_gray,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:30}}]}
execute as @s[tag=subforward,tag=color_light_gray,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:31}}]}
execute as @s[tag=subforward,tag=color_light_gray,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:32}}]}
execute as @s[tag=subbackwards,tag=color_light_gray,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:32}}]}
execute as @s[tag=subbackwards,tag=color_light_gray,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:31}}]}
execute as @s[tag=subbackwards,tag=color_light_gray,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:30}}]}
execute as @s[tag=subbackwards,tag=color_light_gray,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:29}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

