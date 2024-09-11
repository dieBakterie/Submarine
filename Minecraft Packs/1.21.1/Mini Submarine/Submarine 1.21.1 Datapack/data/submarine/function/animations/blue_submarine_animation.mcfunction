#// Description: This function is responsible for animating the blue submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_blue,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:5}}]}
execute as @s[tag=subforward,tag=color_blue,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:6}}]}
execute as @s[tag=subforward,tag=color_blue,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:7}}]}
execute as @s[tag=subforward,tag=color_blue,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:8}}]}
execute as @s[tag=subbackwards,tag=color_blue,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:8}}]}
execute as @s[tag=subbackwards,tag=color_blue,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:7}}]}
execute as @s[tag=subbackwards,tag=color_blue,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:6}}]}
execute as @s[tag=subbackwards,tag=color_blue,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:5}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

