execute unless block ^ ^ ^0.5 #minecraft:air run summon minecraft:item_display ~ ~60.5 ~ {Tags:["nuke"]}
execute if block ^ ^ ^0.5 #minecraft:air positioned ^ ^ ^0.5 if entity @s[distance=..512] run function mp:raycast_nuke
