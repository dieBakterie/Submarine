execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:water_bucket",Count:1b}}] run scoreboard players set @s rptrain_crgtype 1
execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:lava_bucket",Count:1b}}] run scoreboard players set @s rptrain_crgtype 2
execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:milk_bucket",Count:1b}}] run scoreboard players set @s rptrain_crgtype 3
execute if entity @s[scores={rptrain_crgtype=1..}] run function trains_gshn:cargo_tankwagon_loadtype
