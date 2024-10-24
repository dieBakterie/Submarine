summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,NoBasePlate:1b,Tags:["vehicle","sub","subspawn","sub2","color_cyan"],DisabledSlots:4144959,Passengers:[{id:minecart,NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["sub2"],CustomName:'"subseat"'}],ArmorItems:[{},{},{},{id:diamond_hoe,count:1,components:{item_model:"submarine:submarines/cyan/cyan_submarine_1"}}],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F],CustomName:'"sub"'}
summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,NoBasePlate:1b,Tags:["sub","sub2"],DisabledSlots:4144959,Passengers:[{id:chest_minecart,NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["sub2"],CustomName:'"subchest"'}],CustomName:'"subback"'}
scoreboard players set @e[name=sub,tag=subspawn] animation 0
scoreboard players set @e[name=sub,tag=subspawn] subtorpedo 0
scoreboard players set @e[name=sub,tag=subspawn] subsonar 0
scoreboard players set @e[name=sub,tag=subspawn] subenergy 5000
scoreboard players set @e[name=sub,tag=subspawn] subenergy_max 50
scoreboard players set @e[name=sub,tag=subspawn] subhp 100
scoreboard players set @e[name=sub,tag=subspawn] subsound 0
tag @e[name=sub,tag=subspawn] remove subspawn
kill @s

