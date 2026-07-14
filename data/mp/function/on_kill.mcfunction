# グローバルのキル数を1増やす
scoreboard players add #GLOBAL mp_current 1

# 進捗をリセット（これをしないと1回しか反応しない）
advancement revoke @s only mp:kill_monster
