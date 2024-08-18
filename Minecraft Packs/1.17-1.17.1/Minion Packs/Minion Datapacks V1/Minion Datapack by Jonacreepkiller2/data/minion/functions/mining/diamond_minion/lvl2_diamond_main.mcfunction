#fuse
execute as @e[tag=diamond_obfuscated] positioned as @s unless block ^ ^ ^ diamond_ore run tag @s remove diamond_obfuscated
execute as @e[tag=diamond.gen,tag=!diamond_obfuscated] positioned as @s if block ^ ^ ^ diamond_ore run tag @s add diamond_obfuscated
execute as @e[tag=diamond_minion,tag=lvl2] at @s if entity @e[tag=diamond.gen,limit=24,distance=..3] run tag @s add diamond.gen_true


#get minion
execute as @e[tag=diamond_minion,tag=lvl2] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"diamond remover"}'}}}}] run tag @p add diamond.crafter_lvl2
execute as @e[tag=diamond_minion,tag=lvl2] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"diamond remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace diamond_ore
execute as @e[tag=diamond_minion,tag=lvl2] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"diamond remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=diamond.crafter_lvl2] run give @s player_head{display:{Name:"{\"text\":\"Diamond Minion II\"}"},SkullOwner:{Id:[I;-1335783631,-1201192508,-1861481490,-658464717],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjJkMjA0ZjNiNGJiNGRjMzdhMDk0OWY1ODc3ODg0ODlhMWNkMTQ4ODIxYTEwN2FiMDU3NTgyY2VjMWJjZDEwMyJ9fX0="}]}}}
execute as @a[tag=diamond.crafter_lvl2] run give @s tripwire_hook{display:{Name:'{"text":"diamond remover"}'}}
execute as @a[tag=diamond.crafter_lvl2,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"diamond remover"}'}}}]}] run tag @s remove diamond.crafter_lvl2

#main
scoreboard players add @e[tag=diamond_minion,tag=lvl2] dia_gen_delay 1
execute as @e[scores={dia_gen_delay=300},tag=lvl2] at @s positioned as @e[distance=..3,tag=!diamond_obfuscated,tag=diamond.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ diamond_ore
execute as @e[scores={dia_gen_delay=300},tag=lvl2] run scoreboard players add @s dia_ore_counter 1
execute as @e[scores={dia_ore_counter=24},tag=lvl2] at @s run tag @e[distance=..3,tag=diamond_obfuscated,limit=1,sort=random] add diamond_selected
execute as @e[scores={dia_ore_counter=24},tag=lvl2] if entity @e[tag=diamond_selected] run function dp_by_j:mining/diamond_minion/diamond_minion/diamond/lvl2/lvl2_diamond_mining
execute as @e[scores={dia_gen_delay=300,dia_ore_counter=1..},tag=lvl2] run scoreboard players set @s dia_gen_delay 0