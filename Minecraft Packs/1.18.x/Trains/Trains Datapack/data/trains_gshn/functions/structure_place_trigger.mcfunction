execute if entity @s[name=rptrain_turnright_structure] run function trains_gshn:structure_turnright
execute if entity @s[name=rptrain_turnleft_structure] run function trains_gshn:structure_turnleft
execute if entity @s[name=rptrain_slope_structure] run function trains_gshn:structure_slope
execute if entity @s[name=rptrain_detector_structure] run function trains_gshn:structure_detector
execute if entity @s[name=rptrain_colordetector_structure] run function trains_gshn:structure_colordetector
execute if entity @s[name=rptrain_speedstop_structure] run function trains_gshn:structure_speedstop
execute if entity @s[name=rptrain_speedslow_structure] run function trains_gshn:structure_speedslow
execute if entity @s[name=rptrain_speedmedium_structure] run function trains_gshn:structure_speedmedium
execute if entity @s[name=rptrain_speedfast_structure] run function trains_gshn:structure_speedfast
execute if entity @s[name=rptrain_stationthroughleft_structure] run function trains_gshn:structure_stationthroughleft
execute if entity @s[name=rptrain_stationterminusleft_structure] run function trains_gshn:structure_stationterminusleft
execute if entity @s[name=rptrain_stationthroughright_structure] run function trains_gshn:structure_stationthroughright
execute if entity @s[name=rptrain_stationterminusright_structure] run function trains_gshn:structure_stationterminusright
execute if entity @s[name=rptrain_horn_structure] run function trains_gshn:structure_horn
execute if entity @s[name=rptrain_bell_structure] run function trains_gshn:structure_bell
tp @s ~ -1000 ~
kill @s
