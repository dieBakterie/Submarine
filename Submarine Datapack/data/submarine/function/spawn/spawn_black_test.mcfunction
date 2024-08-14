tag @s add nosubclose
execute as @e[name=sub,distance=..8,limit=1] at @s run tellraw @a[distance=..10] [{"text":"Too close of another submarine!","color":"red"}]
execute as @e[name=sub,distance=..8] at @s run tag @e[name="Spawn Submarine",tag=color_black] remove nosubclose
kill @e[name="Spawn Submarine",tag=color_black, tag=!nosubclose]
execute as @s[name="Spawn Submarine",tag=color_black,tag=nosubclose] at @s run function submarine:spawn/spawn_black

