#// Description: This function is responsible for animating the magenta submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_magenta,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:37}}]}
execute as @s[tag=subforward,tag=color_magenta,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:38}}]}
execute as @s[tag=subforward,tag=color_magenta,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:39}}]}
execute as @s[tag=subforward,tag=color_magenta,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:40}}]}
execute as @s[tag=subbackwards,tag=color_magenta,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:40}}]}
execute as @s[tag=subbackwards,tag=color_magenta,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:39}}]}
execute as @s[tag=subbackwards,tag=color_magenta,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:38}}]}
execute as @s[tag=subbackwards,tag=color_magenta,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:37}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

