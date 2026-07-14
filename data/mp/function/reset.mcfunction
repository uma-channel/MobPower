scoreboard players set #GLOBAL mp_current 0
scoreboard players set #GLOBAL mp_req 5
scoreboard players set #GLOBAL mp_level 1
scoreboard players set #GLOBAL mp_is_max 0

bossbar set mp:bar color red
bossbar set mp:bar value 0
bossbar set mp:bar max 5

# 属性リセット
execute as @a run attribute @s minecraft:max_health base set 20.0
execute as @a run attribute @s minecraft:movement_speed base set 0.1
execute as @a run attribute @s minecraft:attack_damage base set 1.0

# エフェクトリセット
effect clear @e

tellraw @a {"text":"[System] リセットしました。","color":"red"}