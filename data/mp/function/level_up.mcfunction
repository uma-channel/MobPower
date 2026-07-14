# 1. 現在のキル数を消費
scoreboard players operation #GLOBAL mp_current -= #GLOBAL mp_req

# 2. レベルを1上げる
scoreboard players add #GLOBAL mp_level 1

# 3. 新しい目標キル数を手動設定
execute if score #GLOBAL mp_level matches 2 run scoreboard players set #GLOBAL mp_req 10
execute if score #GLOBAL mp_level matches 3 run scoreboard players set #GLOBAL mp_req 10
execute if score #GLOBAL mp_level matches 4 run scoreboard players set #GLOBAL mp_req 15
execute if score #GLOBAL mp_level matches 5 run scoreboard players set #GLOBAL mp_req 15
execute if score #GLOBAL mp_level matches 6 run scoreboard players set #GLOBAL mp_req 20
execute if score #GLOBAL mp_level matches 7 run scoreboard players set #GLOBAL mp_req 20
execute if score #GLOBAL mp_level matches 8 run scoreboard players set #GLOBAL mp_req 25
execute if score #GLOBAL mp_level matches 9 run scoreboard players set #GLOBAL mp_req 50

# 4. Lv.10に達したらMAXモードへ移行
execute if score #GLOBAL mp_level matches 10.. run scoreboard players set #GLOBAL mp_is_max 1

# 5. 演出
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1 1
execute as @a at @s run function mp:vfx_levelup
execute if score #GLOBAL mp_is_max matches 1 run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.5 1

# 6. タイトル表示
execute if score #GLOBAL mp_is_max matches 0 run title @a title {"text":"LEVEL UP!","color":"aqua","bold":true}
execute if score #GLOBAL mp_is_max matches 0 run title @a subtitle [{"text":"Level: ","bold":true}]
title @a subtitle [{"text":"Level: ","color":"gray"},{"score":{"name":"#GLOBAL","objective":"mp_level"},"color":"green","bold":true}]


# 7. パワーアップの適用
execute as @a run function mp:apply_power
