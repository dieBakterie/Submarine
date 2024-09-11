#// Description: This function is responsible for animating the yellow submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_yellow,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:61}}]}
execute as @s[tag=subforward,tag=color_yellow,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:62}}]}
execute as @s[tag=subforward,tag=color_yellow,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:63}}]}
execute as @s[tag=subforward,tag=color_yellow,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:64}}]}
execute as @s[tag=subbackwards,tag=color_yellow,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:64}}]}
execute as @s[tag=subbackwards,tag=color_yellow,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:63}}]}
execute as @s[tag=subbackwards,tag=color_yellow,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:62}}]}
execute as @s[tag=subbackwards,tag=color_yellow,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:61}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

