#fuse
execute as @e[tag=redstone_obfuscated] positioned as @s unless block ^ ^ ^ redstone_ore run tag @s remove redstone_obfuscated
execute as @e[tag=redstone.gen,tag=!redstone_obfuscated] positioned as @s if block ^ ^ ^ redstone_ore run tag @s add redstone_obfuscated
execute as @e[tag=redstone_minion,tag=lvl1] at @s if entity @e[tag=redstone.gen,limit=24,distance=..3] run tag @s add redstone.gen_true


#customcrafting
execute as @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}},tag=lvl1] run tag @p add redstone.crafter_lvl1
execute as @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:64b}}] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:wooden_pickaxe",Count:1b}},tag=lvl1] run kill @e[type=item,distance=..0.75]
execute as @a[tag=redstone.crafter_lvl1] run
execute as @a[tag=redstone.crafter_lvl1] run give @s tripwire_hook{display:{Name:'{"text":"redstone remover"}'}}
execute as @a[tag=redstone.crafter_lvl1,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"redstone remover"}'}}}]}] run tag @s remove redstone.crafter_lvl1
execute as @e[tag=redstone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"redstone remover"}'}}}}] run tag @p add redstone.crafter_lvl1
execute as @e[tag=redstone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"redstone remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace redstone_ore
execute as @e[tag=redstone_minion,tag=lvl1] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"redstone remover"}'}}}}] run kill @e[type=!player,distance=..3]

#main
scoreboard players add @e[tag=redstone_minion,tag=lvl1] red_gen_delay 1
execute as @e[scores={red_gen_delay=360},tag=lvl1] at @s positioned as @e[tag=!redstone_obfuscated,tag=redstone.gen,sort=random,limit=1,distance=..3] run setblock ^ ^ ^ redstone_ore
execute as @e[scores={red_gen_delay=360},tag=lvl1] run scoreboard players add @s red_ore_counter 1
execute as @e[scores={red_ore_counter=24},tag=lvl1] at @s run tag @e[distance=..3,tag=redstone_obfuscated,limit=1,sort=random] add redstone_selected
execute as @e[scores={red_ore_counter=24},tag=lvl1] if entity @e[tag=redstone_selected] run function dp_by_j:mining/redstone_minion/redstone/redstone_minion/redstone/lvl1/lvl1_redstone_mining
execute as @e[scores={red_gen_delay=360,red_ore_counter=1..},tag=lvl1] run scoreboard players set @s red_gen_delay 0