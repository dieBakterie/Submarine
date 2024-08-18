#fuse
execute as @e[tag=emerald_obfuscated] positioned as @s unless block ^ ^ ^ emerald_ore run tag @s remove emerald_obfuscated
execute as @e[tag=emerald.gen,tag=!emerald_obfuscated] positioned as @s if block ^ ^ ^ emerald_ore run tag @s add emerald_obfuscated
execute as @e[tag=emerald_minion,tag=lvl11] at @s if entity @e[distance=..3,tag=emerald.gen,limit=24] run tag @s add emerald.gen_true


#get minion
execute as @e[tag=emerald_minion,tag=lvl11] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run tag @p add emerald.crafter_lvl11
execute as @e[tag=emerald_minion,tag=lvl11] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace emerald_ore
execute as @e[tag=emerald_minion,tag=lvl11] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=emerald.crafter_lvl11] run give @s player_head{display:{Name:"{\"text\":\"Emerald Minion XI\"}"},SkullOwner:{Id:[I;-2120731301,-1847111853,-1709920646,-567889883],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMjE3ZDQ4NDQ1MGRlMTc2NzJjY2EyNGI3MzA4ZTAzNmYxYTdmZjE4OGMyMjNmOTU1Mjk1NDlkNTg2Mzc2Y2EwMCJ9fX0="}]}}}
execute as @a[tag=emerald.crafter_lvl11] run give @s tripwire_hook{display:{Name:'{"text":"emerald remover"}'}}
execute as @a[tag=emerald.crafter_lvl11,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}]}] run tag @p remove emerald.crafter_lvl11

#main
scoreboard players add @e[tag=emerald_minion,tag=lvl11] eme_gen_delay 1
execute as @e[scores={eme_gen_delay=280},tag=lvl11] at @s positioned as @e[distance=..3,tag=!emerald_obfuscated,tag=emerald.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ emerald_ore
execute as @e[scores={eme_gen_delay=280},tag=lvl11] run scoreboard players add @s eme_ore_counter 1
execute as @e[scores={eme_ore_counter=24},tag=lvl11] at @s run tag @e[distance=..3,tag=emerald_obfuscated,limit=1,sort=random] add emerald_selected
execute as @e[scores={eme_ore_counter=24},tag=lvl11] if entity @e[tag=emerald_selected] run function dp_by_j:mining/lvl11/lvl11_emerald_mining
execute as @e[scores={eme_gen_delay=280,eme_ore_counter=1..},tag=lvl11] run scoreboard players set @s eme_gen_delay 0