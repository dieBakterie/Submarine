fill ~ ~-3 ~ ~ ~-4 ~ minecraft:air
setblock ~ ~-3 ~ minecraft:command_block[facing=down]{TrackOutput:0b,CustomName:'{"text":"rptrain_slopedown_trigger"}'} replace
setblock ~ ~-4 ~ minecraft:command_block[facing=down]{TrackOutput:0b,CustomName:'{"text":"rptrain_slopeup_trigger"}'} replace
setblock ~ ~ ~ minecraft:oak_sign[rotation=0]{Text1:'{"text":"===============","bold":true}',Text2:'{"text":"Remove","color":"black","bold":true,"clickEvent":{"action":"run_command","value":"/fill ~0 ~-3 ~0 ~0 ~-4 ~0 air"}}',Text3:'{"text":"Structure","color":"black","bold":true,"clickEvent":{"action":"run_command","value":"/tellraw @p [\\"\\",{\\"text\\":\\"-- Structure Removed! --\\"}]"}}',Text4:'{"text":"===============","bold":true}'} replace
execute if entity @a[y_rotation=-23..22,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-4 ~ {Command:"slope1"}
execute if entity @a[y_rotation=23..67,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-4 ~ {Command:"slope2"}
execute if entity @a[y_rotation=68..112,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-4 ~ {Command:"slope3"}
execute if entity @a[y_rotation=113..157,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-4 ~ {Command:"slope4"}
execute if entity @a[y_rotation=158..202,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-4 ~ {Command:"slope5"}
execute if entity @a[y_rotation=203..247,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-4 ~ {Command:"slope6"}
execute if entity @a[y_rotation=248..292,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-4 ~ {Command:"slope7"}
execute if entity @a[y_rotation=293..337,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-4 ~ {Command:"slope8"}
execute if entity @a[y_rotation=158..202,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-3 ~ {Command:"slope1"}
execute if entity @a[y_rotation=203..247,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-3 ~ {Command:"slope2"}
execute if entity @a[y_rotation=248..292,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-3 ~ {Command:"slope3"}
execute if entity @a[y_rotation=293..337,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-3 ~ {Command:"slope4"}
execute if entity @a[y_rotation=-23..22,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-3 ~ {Command:"slope5"}
execute if entity @a[y_rotation=23..67,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-3 ~ {Command:"slope6"}
execute if entity @a[y_rotation=68..112,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-3 ~ {Command:"slope7"}
execute if entity @a[y_rotation=113..157,distance=..5,limit=1,sort=nearest] run data merge block ~ ~-3 ~ {Command:"slope8"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=0}] run data merge block ~ ~-4 ~ {Command:"slope1"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=45}] run data merge block ~ ~-4 ~ {Command:"slope2"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=90}] run data merge block ~ ~-4 ~ {Command:"slope3"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=135}] run data merge block ~ ~-4 ~ {Command:"slope4"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=180}] run data merge block ~ ~-4 ~ {Command:"slope5"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=225}] run data merge block ~ ~-4 ~ {Command:"slope6"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=270}] run data merge block ~ ~-4 ~ {Command:"slope7"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=315}] run data merge block ~ ~-4 ~ {Command:"slope8"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=180}] run data merge block ~ ~-3 ~ {Command:"slope1"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=225}] run data merge block ~ ~-3 ~ {Command:"slope2"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=270}] run data merge block ~ ~-3 ~ {Command:"slope3"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=315}] run data merge block ~ ~-3 ~ {Command:"slope4"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=0}] run data merge block ~ ~-3 ~ {Command:"slope5"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=45}] run data merge block ~ ~-3 ~ {Command:"slope6"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=90}] run data merge block ~ ~-3 ~ {Command:"slope7"}
execute if entity @s[type=armor_stand,tag=rptrain_railtool,scores={rptrain_rotation=135}] run data merge block ~ ~-3 ~ {Command:"slope8"}
