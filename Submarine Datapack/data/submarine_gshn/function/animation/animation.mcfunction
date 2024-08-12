scoreboard players add @s animation 1
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_black_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_blue_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_brown_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_cyan_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_gray_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_green_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_light_blue_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_light_gray_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_lime_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_magenta_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_orange_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_pink_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_purple_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_red_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_white_animation
execute as @s[scores={animation=1..8}] run function submarine_gshn:animation/forward/minisub_yellow_animation
# scoreboard players set @s[scores={animation=1}] animation 2
scoreboard players set @s[scores={animation=9..}] animation 0

