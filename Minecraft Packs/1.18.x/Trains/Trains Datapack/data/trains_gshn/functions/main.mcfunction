execute if entity @e[type=minecraft:pig,tag=rptrain_train] run effect give @e[type=minecraft:pig,tag=rptrain_train] minecraft:invisibility 10 1 true
execute if entity @e[type=minecraft:armor_stand,name=rptrain_colorpicker,scores={rptrain_color=1..}] as @e[type=minecraft:armor_stand,name=rptrain_colorpicker,scores={rptrain_color=1..}] at @s run function trains_gshn:structure_colorpicker
execute if entity @e[type=minecraft:armor_stand,name=rptrain_colorpicker] as @e[type=minecraft:armor_stand,name=rptrain_colorpicker] at @s unless entity @a[distance=..5] run kill @s
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_bogie] as @e[type=minecraft:armor_stand,tag=rptrain_bogie] at @s run function trains_gshn:chunk_loader
execute if entity @e[type=minecraft:armor_stand,name=rptrain_model] as @e[type=minecraft:armor_stand,name=rptrain_model] at @s run function trains_gshn:rotation_fix
execute if entity @e[tag=rptrain_train] as @e[tag=rptrain_train] at @s run function trains_gshn:collision_trigger
execute if entity @e[tag=rptrain_remove] as @e[tag=rptrain_remove] at @s run function trains_gshn:remove
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=rptrain_linker,tag=!rptrain_loco,tag=!rptrain_unlinked] as @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=rptrain_linker,tag=!rptrain_loco,tag=!rptrain_unlinked] at @s run function trains_gshn:link_break
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=rptrain_unlinked] as @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=rptrain_unlinked] at @s run function trains_gshn:link_join
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_decouple] as @e[type=minecraft:armor_stand,tag=rptrain_decouple] at @s run function trains_gshn:link_decouple
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_steamwheels] as @e[type=minecraft:armor_stand,tag=rptrain_steamwheels] at @s run function trains_gshn:model_steamwheels
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_opendoorright,tag=rptrain_bogie] as @e[type=minecraft:armor_stand,tag=rptrain_opendoorright,tag=rptrain_bogie] at @s run function trains_gshn:model_opendoorright_trigger
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_opendoorleft,tag=rptrain_bogie] as @e[type=minecraft:armor_stand,tag=rptrain_opendoorleft,tag=rptrain_bogie] at @s run function trains_gshn:model_opendoorleft_trigger
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_closedoor,tag=rptrain_bogie] as @e[type=minecraft:armor_stand,tag=rptrain_closedoor,tag=rptrain_bogie] at @s run function trains_gshn:model_closedoor_trigger
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_loco,tag=rptrain_linker] as @e[type=minecraft:armor_stand,tag=rptrain_loco,tag=rptrain_linker] at @s run function trains_gshn:speed_control
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=rptrain_linker,tag=!rptrain_decouple] as @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=rptrain_linker,tag=!rptrain_decouple] at @s run function trains_gshn:speed_update
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_bogie,scores={rptrain_speed=2..}] as @e[type=minecraft:armor_stand,tag=rptrain_bogie,scores={rptrain_speed=2..}] at @s run function trains_gshn:speed_forward
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_bogie,scores={rptrain_speed=..-2}] as @e[type=minecraft:armor_stand,tag=rptrain_bogie,scores={rptrain_speed=..-2}] at @s run function trains_gshn:speed_reverse
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_loco,scores={rptrain_station=1..}] as @e[type=minecraft:armor_stand,tag=rptrain_loco,scores={rptrain_station=1..}] at @s run function trains_gshn:station_timer
execute if entity @e[type=minecraft:bat,tag=rptrain_structure] as @e[type=minecraft:bat,tag=rptrain_structure] at @s run function trains_gshn:structure_place_trigger
execute if entity @e[type=minecraft:turtle,tag=rptrain_trainspawn] as @e[type=minecraft:turtle,tag=rptrain_trainspawn] at @s run function trains_gshn:spawn_trigger
execute if entity @a[scores={rptrain_color=0..}] as @a[scores={rptrain_color=0..}] at @s run function trains_gshn:model_color
execute if entity @e[type=minecraft:armor_stand,name=rptrain_base_middle,tag=rptrain_cargowagon] as @e[type=minecraft:armor_stand,name=rptrain_base_middle,tag=rptrain_cargowagon] at @s run function trains_gshn:cargo_trigger
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=rptrain_linker] as @e[type=minecraft:armor_stand,tag=rptrain_bogie,tag=rptrain_linker] at @s run function trains_gshn:sound_rail_trigger
execute if entity @a[nbt={SelectedItem:{id:"minecraft:bat_spawn_egg",tag:{display:{Name:'{"text":"[Rail - Turn Right]","color":"blue","bold":true}'}}}}] as @a[nbt={SelectedItem:{id:"minecraft:bat_spawn_egg",tag:{display:{Name:'{"text":"[Rail - Turn Right]","color":"blue","bold":true}'}}}}] at @s align xyz positioned ~0.5 ~ ~0.5 run function trains_gshn:particle_turnright_egg
execute if entity @a[nbt={SelectedItem:{id:"minecraft:bat_spawn_egg",tag:{display:{Name:'{"text":"[Rail - Turn Left]","color":"blue","bold":true}'}}}}] as @a[nbt={SelectedItem:{id:"minecraft:bat_spawn_egg",tag:{display:{Name:'{"text":"[Rail - Turn Left]","color":"blue","bold":true}'}}}}] at @s align xyz positioned ~0.5 ~ ~0.5 run function trains_gshn:particle_turnleft_egg
execute if entity @a[nbt={SelectedItem:{id:"minecraft:bat_spawn_egg",tag:{display:{Name:'{"text":"[Rail - Slope]","color":"blue","bold":true}'}}}}] as @a[nbt={SelectedItem:{id:"minecraft:bat_spawn_egg",tag:{display:{Name:'{"text":"[Rail - Slope]","color":"blue","bold":true}'}}}}] at @s align xyz positioned ~0.5 ~ ~0.5 run function trains_gshn:particle_slope_egg
execute if entity @e[type=minecraft:bat,name=rptrain_railtool] as @e[type=minecraft:bat,name=rptrain_railtool] at @s run function trains_gshn:railtool_spawn
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_railtool] as @e[type=minecraft:armor_stand,tag=rptrain_railtool] at @s run function trains_gshn:railtool_structure_trigger
execute if entity @e[type=minecraft:armor_stand,name=rptrain_base_front,scores={rptrain_speed=30..}] as @e[type=minecraft:armor_stand,name=rptrain_base_front,scores={rptrain_speed=30..}] at @s run function trains_gshn:runover_trigger
execute if entity @e[type=minecraft:armor_stand,name=rptrain_base_back,scores={rptrain_speed=..-30}] as @e[type=minecraft:armor_stand,name=rptrain_base_back,scores={rptrain_speed=..-30}] at @s run function trains_gshn:runover_trigger
execute if entity @e[tag=rptrain_runover] as @e[tag=rptrain_runover] at @s run function trains_gshn:runover
execute if entity @e[type=minecraft:bat,name=rptrain_freerailtool] as @e[type=minecraft:bat,name=rptrain_freerailtool] at @s run function trains_gshn:freerailtool_spawn
execute if entity @e[type=minecraft:armor_stand,tag=rptrain_freerailtool1] if entity @e[type=minecraft:armor_stand,tag=rptrain_freerailtool2] as @e[type=minecraft:armor_stand,tag=rptrain_freerailtool] at @s run function trains_gshn:freerailtool_particles
execute if entity @e[type=minecraft:armor_stand,name=rptrain_freerailbuilder,tag=!rptrain_spawn] as @e[type=minecraft:armor_stand,name=rptrain_freerailbuilder,tag=!rptrain_spawn] at @s run function trains_gshn:freerailtool_build_turnrail
execute if entity @a[nbt={Inventory:[{id:"minecraft:book",tag:{display:{Name:'{"text":"Train Controls"}'}}}]}] as @a[nbt={Inventory:[{id:"minecraft:book",tag:{display:{Name:'{"text":"Train Controls"}'}}}]}] at @s run function trains_gshn:player_book_replace
execute if entity @e[type=minecraft:villager,name=Locomotive_Seller] as @e[type=minecraft:villager,name=Locomotive_Seller] at @s run function trains_gshn:villager_rename_locomotive
execute if entity @e[type=minecraft:villager,name=Wagon_Seller] as @e[type=minecraft:villager,name=Wagon_Seller] at @s run function trains_gshn:villager_rename_wagon
execute if entity @e[type=minecraft:villager,name=Rail_Structure_Seller] as @e[type=minecraft:villager,name=Rail_Structure_Seller] at @s run function trains_gshn:villager_rename_rail