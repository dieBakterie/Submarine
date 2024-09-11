#// Description: This function is responsible for animating the black submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_black,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:1}}]}
execute as @s[tag=subforward,tag=color_black,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:2}}]}
execute as @s[tag=subforward,tag=color_black,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:3}}]}
execute as @s[tag=subforward,tag=color_black,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:4}}]}
execute as @s[tag=subbackwards,tag=color_black,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:4}}]}
execute as @s[tag=subbackwards,tag=color_black,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:3}}]}
execute as @s[tag=subbackwards,tag=color_black,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:2}}]}
execute as @s[tag=subbackwards,tag=color_black,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:1}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

