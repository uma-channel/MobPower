tellraw @a [{text:"[MobPower] ",color:red},{text:"Hello, World!",color:white}]

# 必要なスコアボードのみ作成
scoreboard objectives add mp_current dummy
scoreboard objectives add mp_req dummy
scoreboard objectives add mp_level dummy
scoreboard objectives add mp_remain dummy
scoreboard objectives add mp_is_max dummy

scoreboard objectives add life dummy

scoreboard objectives add circle_rot dummy
scoreboard objectives add calc dummy
scoreboard objectives add base_yaw dummy
scoreboard players set #90 circle_rot 90
scoreboard players set #180 circle_rot 180
scoreboard players set #270 circle_rot 270

# team作成
team add player
team add monster
team add animal
team modify player color green
team modify monster color red
team modify animal color yellow
team modify monster friendlyFire false

# 今この瞬間にしゃがんでいるかを自動で測る（累計だが、毎tick 0 に戻して利用する）
scoreboard objectives add sneak_check minecraft.custom:minecraft.sneak_time

# 3秒チャージを計算するための「独自の変数」
scoreboard objectives add sneak_timer dummy

# ボスバーの初期化
bossbar add mp:bar {"text":"Next Level"}
bossbar set mp:bar visible true
bossbar set mp:bar players @a
bossbar set mp:bar color red
bossbar set mp:bar style progress

# 初期値設定
execute unless score #GLOBAL mp_level matches 1.. run scoreboard players set #GLOBAL mp_level 1
execute if score #GLOBAL mp_level matches 1 run scoreboard players set #GLOBAL mp_req 5
execute unless score #GLOBAL mp_is_max matches 0.. run scoreboard players set #GLOBAL mp_is_max 0