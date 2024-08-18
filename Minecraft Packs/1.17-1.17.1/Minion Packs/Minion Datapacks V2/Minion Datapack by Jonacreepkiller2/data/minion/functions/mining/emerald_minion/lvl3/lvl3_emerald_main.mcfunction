#fuse
execute as @e[tag=emerald_obfuscated] positioned as @s unless block ^ ^ ^ emerald_ore run tag @s remove emerald_obfuscated
execute as @e[tag=emerald.gen,tag=!emerald_obfuscated] positioned as @s if block ^ ^ ^ emerald_ore run tag @s add emerald_obfuscated
execute as @e[tag=emerald_minion,tag=lvl3] at @s if entity @e[distance=..3,tag=emerald.gen,limit=24] run tag @s add emerald.gen_true


#get minion
execute as @e[tag=emerald_minion,tag=lvl3] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run tag @p add emerald.crafter_lvl3
execute as @e[tag=emerald_minion,tag=lvl3] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run fill ^-2 ^-1 ^-2 ^2 ^-1 ^2 air replace emerald_ore
execute as @e[tag=emerald_minion,tag=lvl3] at @s if entity @e[type=item,distance=..0.75,nbt={Item:{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}}] run kill @e[type=!player,distance=..3]
execute as @a[tag=emerald.crafter_lvl3] run give @s player_head{display:{Name:"{\"text\":\"Emerald Minion III\"}"},SkullOwner:{Id:[I;-1548863687,785336922,-1833812709,1353576999],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTM1ZWFlMTgwMzcxMTlkNjI4ZjY4YTQ0ZmU4ZDRiN2MyODQwM2E0MDIxZDdkOThiMDI4YjgyZDI4MTE3NmQzYSJ9fX0="}]}}}
execute as @a[tag=emerald.crafter_lvl3] run give @s tripwire_hook{display:{Name:'{"text":"emerald remover"}'}}
execute as @a[tag=emerald.crafter_lvl3,nbt={Inventory:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'{"text":"emerald remover"}'}}}]}] run tag @p remove emerald.crafter_lvl3

#main
scoreboard players add @e[tag=emerald_minion,tag=lvl3] eme_gen_delay 1
execute as @e[scores={eme_gen_delay=280},tag=lvl3] at @s positioned as @e[distance=..3,tag=!emerald_obfuscated,tag=emerald.gen,sort=random,limit=1] if block ^ ^ ^ air run setblock ^ ^ ^ emerald_ore
execute as @e[scores={eme_gen_delay=280},tag=lvl3] run scoreboard players add @s eme_ore_counter 1
execute as @e[scores={eme_ore_counter=24},tag=lvl3] at @s run tag @e[distance=..3,tag=emerald_obfuscated,limit=1,sort=random] add emerald_selected
execute as @e[scores={eme_ore_counter=24},tag=lvl3] if entity @e[tag=emerald_selected] run function dp_by_j:mining/lvl3/lvl3_emerald_mining
execute as @e[scores={eme_gen_delay=280,eme_ore_counter=1..},tag=lvl3] run scoreboard players set @s eme_gen_delay 0