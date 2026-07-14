scoreboard players operation #GLOBAL mp_remain = #GLOBAL mp_req
scoreboard players operation #GLOBAL mp_remain -= #GLOBAL mp_current

bossbar set mp:bar color red
bossbar set mp:bar name [{"text":"次のレベルまで 残り: ","color":"yellow"},{"score":{"name":"#GLOBAL","objective":"mp_remain"},"color":"white","bold":true},{"text":" 体","color":"yellow"}]
execute store result bossbar mp:bar value run scoreboard players get #GLOBAL mp_current
execute store result bossbar mp:bar max run scoreboard players get #GLOBAL mp_req
