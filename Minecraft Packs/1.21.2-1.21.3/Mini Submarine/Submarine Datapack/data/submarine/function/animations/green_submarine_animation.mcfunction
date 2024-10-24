#// Description: This function is responsible for animating the green submarine.
scoreboard players add @s animation 1
execute as @s[tag=subforward,tag=color_green,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:paper,count:1,components:{item_model:"submarine:submarines/green/green_submarine_1"}}]}
execute as @s[tag=subforward,tag=color_green,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:paper,count:1,components:{item_model:"submarine:submarines/green/green_submarine_2"}}]}
execute as @s[tag=subforward,tag=color_green,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:paper,count:1,components:{item_model:"submarine:submarines/green/green_submarine_3"}}]}
execute as @s[tag=subforward,tag=color_green,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:paper,count:1,components:{item_model:"submarine:submarines/green/green_submarine_4"}}]}
execute as @s[tag=subbackwards,tag=color_green,scores={animation=1}] run data merge entity @s {ArmorItems:[{},{},{},{id:paper,count:1,components:{item_model:"submarine:submarines/green/green_submarine_4"}}]}
execute as @s[tag=subbackwards,tag=color_green,scores={animation=2}] run data merge entity @s {ArmorItems:[{},{},{},{id:paper,count:1,components:{item_model:"submarine:submarines/green/green_submarine_3"}}]}
execute as @s[tag=subbackwards,tag=color_green,scores={animation=3}] run data merge entity @s {ArmorItems:[{},{},{},{id:paper,count:1,components:{item_model:"submarine:submarines/green/green_submarine_2"}}]}
execute as @s[tag=subbackwards,tag=color_green,scores={animation=4}] run data merge entity @s {ArmorItems:[{},{},{},{id:paper,count:1,components:{item_model:"submarine:submarines/green/green_submarine_1"}}]}
scoreboard players set @s[scores={animation=5..}] animation 0
