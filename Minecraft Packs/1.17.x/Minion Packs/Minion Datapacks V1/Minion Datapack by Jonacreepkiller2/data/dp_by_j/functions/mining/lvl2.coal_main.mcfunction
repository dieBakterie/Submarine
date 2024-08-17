#fuse
execute as @e[tag=coal_obfuscated] positioned as @s unless block ^ ^ ^ coal_ore run tag @s remove coal_obfuscated
execute as @e[tag=coal.gen,tag=!coal_obfuscated] positioned as @s if block ^ ^ ^ coal_ore run tag @s add coal_obfuscated
execute as @e[tag=coal_minion,tag=lvl2] at @s if entity @e[tag=coal.gen,limit=24,distance=..3] run tag @s add coal.gen_true


#get minion
execute as @e[tag=coal_minion,tag=lvl2] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run tag @p add coal.crafter_lvl2
execute as @e[tag=coal_minion,tag=lvl2] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace coal_ore
execute as @e[tag=coal_minion,tag=lvl2] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=coal.crafter_lvl2] run give @s player_head{display:{Name:"{\"text\":\"Coal Minion II\"}"},SkullOwner:{Id:[I;1473240539,679561969,-1935337061,-217207974],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTMxNGY2MjAxNDAzNzE1NTdiZDc1ZDZmOTBlMGM3ODI3ODgyMWQ0NTliY2I0NzM5NjliN2JiMjEwZTgwMzg0YyJ9fX0="}]}}}
execute as @a[tag=coal.crafter_lvl2] run give @s tripwire_hook{display:{Name:'{"text":"coal remover"}'}}
execute as @a[tag=coal.crafter_lvl2,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"coal remover"}'}}}]}] run tag @s remove coal.crafter_lvl2

#main
scoreboard players add @e[tag=coal_minion,tag=lvl2] coal_gen_delay 1
execute as @e[scores={coal_gen_delay=140},tag=lvl2] at @s positioned as @e[distance=..3,tag=!coal_obfuscated,tag=coal.gen,sort=random,limit=1] run setblock ^ ^ ^ coal_ore
execute as @e[scores={coal_gen_delay=140},tag=lvl2] run scoreboard players add @s coal_ore_counter 1
execute as @e[scores={coal_ore_counter=24},tag=lvl2] at @s run tag @e[tag=coal_obfuscated,limit=1,sort=random,distance=..3] add coal_selected
execute as @e[scores={coal_ore_counter=24},tag=lvl2] if entity @e[tag=coal_selected] run function dp_by_j:mining/lvl2.coal_mining
execute as @e[scores={coal_gen_delay=140,coal_ore_counter=1..},tag=lvl2] run scoreboard players set @s coal_gen_delay 0