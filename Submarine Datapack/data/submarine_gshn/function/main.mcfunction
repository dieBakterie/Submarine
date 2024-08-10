item replace entity @a[nbt={SelectedItem:{id:"minecraft:farmland",count:1}}] weapon.mainhand with turtle_spawn_egg[custom_name='"Spawn Submarine"',lore=['"Use it on water!"'],entity_data={id:"minecraft:villager",Silent:1b,NoAI:1b,active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:199980,show_particles:0b}]}] 1
tag @a[tag=submariner] remove submariner
execute as @e[name=sub] at @s run function submarine_gshn:submariner
execute as @a[tag=submariner] at @s run function submarine_gshn:rotation
execute as @a[tag=submariner] at @s run function submarine_gshn:movement
execute as @e[name=sub] at @s run function submarine_gshn:collision
execute as @e[name="Spawn Submarine"] at @s run function submarine_gshn:spawn_test
execute as @a[tag=submariner] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:tnt",count:1}}] as @e[name=sub,distance=..2,limit=1,scores={subtorpedo=0,subenergy=1..}] at @s run function submarine_gshn:torpedo_launch
execute as @e[name=subtorpedo] at @s run function submarine_gshn:torpedo
execute as @e[name=sub,scores={subtorpedo=1..}] at @s run function submarine_gshn:torpedo_reload
execute as @e[name=subtorpedo,tag=subtorpexplode] at @s run function submarine_gshn:torpedo_explode
execute as @a[tag=submariner] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:redstone",count:1}}] as @e[name=sub,distance=..2,limit=1,scores={subenergy=1..,subsonar=0}] at @s run scoreboard players set @s subsonar 1
execute as @e[name=sub,scores={subsonar=1..}] at @s run function submarine_gshn:sonar
execute as @e[name=sub,scores={subsonar_ping=1..}] at @s run function submarine_gshn:sonar_ping
execute as @a[tag=submariner] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:redstone_block",count:1}}] as @e[name=sub,distance=..2,limit=1,scores={subenergy=..4999}] at @s run function submarine_gshn:energy_refill
execute as @a[tag=submariner] at @s run function submarine_gshn:hp
execute as @a[tag=submariner] at @s as @e[type=item,distance=..2,limit=1,nbt={Item:{id:"minecraft:iron_block",count:1}}] as @e[name=sub,distance=..2,limit=1,scores={subhp=..99}] at @s run function submarine_gshn:hp_refill
execute as @e[name=sub] at @s run function submarine_gshn:bar
execute as @e[name=sub,scores={subhp=..0}] at @s run function submarine_gshn:explode
execute as @e[name=sub,tag=subforward] at @s run function submarine_gshn:sound
execute as @e[name=sub,tag=subbackwards] at @s run function submarine_gshn:sound
execute as @e[name=sub] at @s run function submarine_gshn:minisub_color_trigger
scoreboard players add @a[tag=submariner] animation 1
scoreboard players set @a[scores={animation=20}] animation 0

