tag @a[tag=submariner] remove submariner
execute as @e[name=sub] at @s run function submarine:submariner
execute as @a[tag=submariner] at @s run function submarine:rotation
execute as @a[tag=submariner] at @s run function submarine:movement
execute as @e[name=sub] at @s run function submarine:collision
execute as @e[name="Spawn black Submarine"] at @s run function submarine:spawn/test/spawn_test_black_submarine
execute as @e[name="Spawn blue Submarine"] at @s run function submarine:spawn/test/spawn_test_blue_submarine
execute as @e[name="Spawn brown Submarine"] at @s run function submarine:spawn/test/spawn_test_brown_submarine
execute as @e[name="Spawn cyan Submarine"] at @s run function submarine:spawn/test/spawn_test_cyan_submarine
execute as @e[name="Spawn gray Submarine"] at @s run function submarine:spawn/test/spawn_test_gray_submarine
execute as @e[name="Spawn green Submarine"] at @s run function submarine:spawn/test/spawn_test_green_submarine
execute as @e[name="Spawn light_blue Submarine"] at @s run function submarine:spawn/test/spawn_test_light_blue_submarine
execute as @e[name="Spawn light_gray Submarine"] at @s run function submarine:spawn/test/spawn_test_light_gray_submarine
execute as @e[name="Spawn lime Submarine"] at @s run function submarine:spawn/test/spawn_test_lime_submarine
execute as @e[name="Spawn magenta Submarine"] at @s run function submarine:spawn/test/spawn_test_magenta_submarine
execute as @e[name="Spawn orange Submarine"] at @s run function submarine:spawn/test/spawn_test_orange_submarine
execute as @e[name="Spawn pink Submarine"] at @s run function submarine:spawn/test/spawn_test_pink_submarine
execute as @e[name="Spawn purple Submarine"] at @s run function submarine:spawn/test/spawn_test_purple_submarine
execute as @e[name="Spawn red Submarine"] at @s run function submarine:spawn/test/spawn_test_red_submarine
execute as @e[name="Spawn white Submarine"] at @s run function submarine:spawn/test/spawn_test_white_submarine
execute as @e[name="Spawn yellow Submarine"] at @s run function submarine:spawn/test/spawn_test_yellow_submarine
execute as @a[tag=submariner] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:tnt",count:1}}] as @e[name=sub,distance=..2,limit=1,scores={subtorpedo=0,subenergy=1..}] at @s run function submarine:torpedo_launch
execute as @e[name=subtorpedo] at @s run function submarine:torpedo
execute as @e[name=sub,scores={subtorpedo=1..}] at @s run function submarine:torpedo_reload
execute as @e[name=subtorpedo,tag=subtorpexplode] at @s run function submarine:torpedo_explode
execute as @a[tag=submariner] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:redstone",count:1}}] as @e[name=sub,distance=..2,limit=1,scores={subenergy=1..,subsonar=0}] at @s run scoreboard players set @s subsonar 1
execute as @e[name=sub,scores={subsonar=1..}] at @s run function submarine:sonar
execute as @e[name=sub,scores={subsonar_ping=1..}] at @s run function submarine:sonar_ping
execute as @a[tag=submariner] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:redstone_block",count:1}}] as @e[name=sub,distance=..2,limit=1,scores={subenergy=..4999}] at @s run function submarine:energy_refill
execute as @a[tag=submariner] at @s run function submarine:hp
execute as @a[tag=submariner] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:iron_block",count:1}}] as @e[name=sub,distance=..2,limit=1,scores={subhp=..99}] at @s run function submarine:hp_refill
execute as @e[name=sub] at @s run function submarine:bar
execute as @e[name=sub,scores={subhp=..0}] at @s run function submarine:explode
execute as @e[name=sub,tag=subforward] at @s run function submarine:animations/submarine_animation
execute as @e[name=sub,tag=subbackwards] at @s run function submarine:animations/submarine_animation
execute as @e[name=sub,tag=subforward] at @s run function submarine:sound
execute as @e[name=sub,tag=subbackwards] at @s run function submarine:sound
execute as @e[name=sub] at @s run function submarine:color_change
execute as @e[name=sub] at @s if entity @e[name="Remove Submarine"] run function submarine:remove_submarines

