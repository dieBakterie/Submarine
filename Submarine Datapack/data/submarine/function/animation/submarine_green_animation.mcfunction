scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_green,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:21}}]}
execute as @s[tag=subforward,tag=color_green,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:22}}]}
execute as @s[tag=subforward,tag=color_green,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:23}}]}
execute as @s[tag=subforward,tag=color_green,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:24}}]}
execute as @s[tag=subbackwards,tag=color_green,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:24}}]}
execute as @s[tag=subbackwards,tag=color_green,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:23}}]}
execute as @s[tag=subbackwards,tag=color_green,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:22}}]}
execute as @s[tag=subbackwards,tag=color_green,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",count:1,components:{custom_model_data:21}}]}
scoreboard players set @s[scores={animation=5..}] animation 0

