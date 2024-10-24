execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:stone",Count:64b}}] run scoreboard players set @s rptrain_crgtype 1
execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:cobblestone",Count:64b}}] run scoreboard players set @s rptrain_crgtype 2
execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:gravel",Count:64b}}] run scoreboard players set @s rptrain_crgtype 3
execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:sand",Count:64b}}] run scoreboard players set @s rptrain_crgtype 4
execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:redstone",Count:64b}}] run scoreboard players set @s rptrain_crgtype 5
execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:coal",Count:64b}}] run scoreboard players set @s rptrain_crgtype 6
execute if entity @e[type=item,distance=..3,limit=1,tag=!rptrain_unloaded,nbt={Item:{id:"minecraft:iron_ore",Count:64b}}] run scoreboard players set @s rptrain_crgtype 7
execute if entity @s[scores={rptrain_crgtype=1..}] run function trains_gshn:cargo_openwagon_loadtype
