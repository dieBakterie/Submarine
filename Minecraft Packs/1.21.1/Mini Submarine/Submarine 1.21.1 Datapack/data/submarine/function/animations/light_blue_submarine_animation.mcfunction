#// Description: This function is responsible for animating the light_blue submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_light_blue,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:25}}]}
execute as @s[tag=subforward,tag=color_light_blue,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:26}}]}
execute as @s[tag=subforward,tag=color_light_blue,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:27}}]}
execute as @s[tag=subforward,tag=color_light_blue,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:28}}]}
execute as @s[tag=subbackwards,tag=color_light_blue,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:28}}]}
execute as @s[tag=subbackwards,tag=color_light_blue,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:27}}]}
execute as @s[tag=subbackwards,tag=color_light_blue,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:26}}]}
execute as @s[tag=subbackwards,tag=color_light_blue,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{custom_model_data:25}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

