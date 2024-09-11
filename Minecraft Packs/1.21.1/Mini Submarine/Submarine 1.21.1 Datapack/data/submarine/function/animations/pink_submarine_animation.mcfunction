#// Description: This function is responsible for animating the pink submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_pink,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:45}}]}
execute as @s[tag=subforward,tag=color_pink,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:46}}]}
execute as @s[tag=subforward,tag=color_pink,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:47}}]}
execute as @s[tag=subforward,tag=color_pink,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:48}}]}
execute as @s[tag=subbackwards,tag=color_pink,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:48}}]}
execute as @s[tag=subbackwards,tag=color_pink,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:47}}]}
execute as @s[tag=subbackwards,tag=color_pink,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:46}}]}
execute as @s[tag=subbackwards,tag=color_pink,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:45}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

