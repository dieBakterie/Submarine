#// Description: This function is responsible for animating the {color} submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_{color},scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:animation_step}}]}
execute as @s[tag=subforward,tag=color_{color},scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:animation_step}}]}
execute as @s[tag=subforward,tag=color_{color},scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:animation_step}}]}
execute as @s[tag=subforward,tag=color_{color},scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:animation_step}}]}
execute as @s[tag=subbackwards,tag=color_{color},scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:animation_step}}]}
execute as @s[tag=subbackwards,tag=color_{color},scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:animation_step}}]}
execute as @s[tag=subbackwards,tag=color_{color},scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:animation_step}}]}
execute as @s[tag=subbackwards,tag=color_{color},scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:animation_step}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

