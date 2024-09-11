#// Description: This function is responsible for animating the purple submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_purple,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:49}}]}
execute as @s[tag=subforward,tag=color_purple,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:50}}]}
execute as @s[tag=subforward,tag=color_purple,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:51}}]}
execute as @s[tag=subforward,tag=color_purple,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:52}}]}
execute as @s[tag=subbackwards,tag=color_purple,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:52}}]}
execute as @s[tag=subbackwards,tag=color_purple,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:51}}]}
execute as @s[tag=subbackwards,tag=color_purple,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:50}}]}
execute as @s[tag=subbackwards,tag=color_purple,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:49}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

