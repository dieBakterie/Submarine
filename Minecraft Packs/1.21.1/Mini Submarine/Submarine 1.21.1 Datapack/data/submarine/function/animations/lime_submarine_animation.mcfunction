#// Description: This function is responsible for animating the lime submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_lime,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:33}}]}
execute as @s[tag=subforward,tag=color_lime,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:34}}]}
execute as @s[tag=subforward,tag=color_lime,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:35}}]}
execute as @s[tag=subforward,tag=color_lime,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:36}}]}
execute as @s[tag=subbackwards,tag=color_lime,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:36}}]}
execute as @s[tag=subbackwards,tag=color_lime,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:35}}]}
execute as @s[tag=subbackwards,tag=color_lime,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:34}}]}
execute as @s[tag=subbackwards,tag=color_lime,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:33}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

