#// Description: This function is responsible for animating the cyan submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_cyan,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:13}}]}
execute as @s[tag=subforward,tag=color_cyan,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:14}}]}
execute as @s[tag=subforward,tag=color_cyan,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:15}}]}
execute as @s[tag=subforward,tag=color_cyan,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:16}}]}
execute as @s[tag=subbackwards,tag=color_cyan,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:16}}]}
execute as @s[tag=subbackwards,tag=color_cyan,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:15}}]}
execute as @s[tag=subbackwards,tag=color_cyan,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:14}}]}
execute as @s[tag=subbackwards,tag=color_cyan,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:13}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

