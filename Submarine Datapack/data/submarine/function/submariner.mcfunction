tag @a[distance=..2] remove submariner
tag @a[distance=..2,limit=1,nbt={RootVehicle:{Entity:{CustomName:'"sub"'}}}] add submariner
effect give @a[tag=submariner,distance=..2,limit=1] minecraft:conduit_power 1 1 true
execute if block ~ ~1 ~ air run tp @s ~ ~-0.1 ~
tp @e[name=subback,distance=..2,limit=1] ^ ^ ^-1

