kill @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:redstone_block",count:1}}]
scoreboard players add @s subenergy 600
scoreboard players set @s[scores={subenergy=5000..}] subenergy 5000
playsound submarine:custom.subcharge master @a[distance=..5] ~ ~ ~ 100

