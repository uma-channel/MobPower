execute as @e[type=ender_dragon] run attribute @s minecraft:explosion_knockback_resistance base set 10000000000000000000000

execute as @e[tag=circle1] at @s positioned ^ ^ ^ run function mp:circle1
execute as @e[tag=circle2] at @s positioned ^ ^ ^ run function mp:circle2
execute as @e[tag=circle3] at @s positioned ^ ^ ^ run function mp:circle3


execute if entity @e[tag=gun] run function mp:gun_flash

# 1. 通常時とMAX時でボスバー表示を分岐
execute if score #GLOBAL mp_is_max matches 0 run function mp:tick_normal
execute if score #GLOBAL mp_is_max matches 1 run function mp:tick_max

# 2. レベルアップ判定（通常時のみ）
execute if score #GLOBAL mp_is_max matches 0 if score #GLOBAL mp_current >= #GLOBAL mp_req run function mp:level_up

# ===================================================================================================================

# --- 1. スコアの増減（各タグごとの速度設定） ---
execute as @e[tag=circle1] run scoreboard players remove @s circle_rot 3
execute as @e[tag=circle2] run scoreboard players add @s circle_rot 2
execute as @e[tag=circle3] run scoreboard players remove @s circle_rot 1

# --- 2. 0-359の範囲に丸めるループ処理 ---
execute as @e[tag=gun_circle] if score @s circle_rot matches ..-1 run scoreboard players add @s circle_rot 360
execute as @e[tag=gun_circle] if score @s circle_rot matches 360.. run scoreboard players remove @s circle_rot 360

# --- 3. 前半の回転処理 (0度～180度：真上から真下へ) ---
# Yawを保存しておいた base_yaw に戻す
execute as @e[tag=gun_circle] if score @s circle_rot matches 0..180 store result entity @s Rotation[0] float 1.0 run scoreboard players get @s base_yaw
# Pitch = circle_rot - 90
execute as @e[tag=gun_circle] if score @s circle_rot matches 0..180 run scoreboard players operation @s calc = @s circle_rot
execute as @e[tag=gun_circle] if score @s circle_rot matches 0..180 run scoreboard players operation @s calc -= #90 circle_rot
execute as @e[tag=gun_circle] if score @s circle_rot matches 0..180 store result entity @s Rotation[1] float 1.0 run scoreboard players get @s calc

# --- 4. 後半の回転処理 (181度～359度：真下から真上へ戻る) ---
# Yawを (base_yaw + 180) に書き換える
execute as @e[tag=gun_circle] if score @s circle_rot matches 181..359 run scoreboard players operation @s calc = @s base_yaw
execute as @e[tag=gun_circle] if score @s circle_rot matches 181..359 run scoreboard players operation @s calc += #180 circle_rot
execute as @e[tag=gun_circle] if score @s circle_rot matches 181..359 store result entity @s Rotation[0] float 1.0 run scoreboard players get @s calc
# Pitch = 270 - circle_rot
execute as @e[tag=gun_circle] if score @s circle_rot matches 181..359 run scoreboard players set @s calc 270
execute as @e[tag=gun_circle] if score @s circle_rot matches 181..359 run scoreboard players operation @s calc -= @s circle_rot
execute as @e[tag=gun_circle] if score @s circle_rot matches 181..359 store result entity @s Rotation[1] float 1.0 run scoreboard players get @s calc


# ===================================================================================================================

# --- A. 状態の検知 ---
execute as @a[scores={sneak_check=1..}] run scoreboard players add @s sneak_timer 1

# --- B. リセット ---
execute as @a[scores={sneak_check=0}] run scoreboard players set @s sneak_timer 0
execute as @a[scores={sneak_check=1}] unless items entity @s weapon.mainhand netherite_axe[custom_name={text:"ニュークアックス",color:dark_red,bold:1b,italic:0b}] unless items entity @s weapon.mainhand netherite_sword[custom_name={text:"レールソード",color:dark_red,bold:1b,italic:0b}] run scoreboard players set @s sneak_timer 0

# --- C. 発動判定 (60tick) ---
execute as @a[scores={sneak_timer=60..}] at @s anchored eyes if items entity @s weapon.mainhand netherite_axe[custom_name={text:"ニュークアックス",color:dark_red,bold:1b,italic:0b}] run function mp:raycast_nuke
execute as @a[scores={sneak_timer=60..}] if items entity @s weapon.mainhand netherite_axe[custom_name={text:"ニュークアックス",color:dark_red,bold:1b,italic:0b}] run tellraw @s {text:"攻撃地点を設定しました！攻撃を開始します..."}
execute as @a[scores={sneak_timer=60..}] at @s if items entity @s weapon.mainhand netherite_sword[custom_name={text:"レールソード",color:dark_red,bold:1b,italic:0b}] run function mp:raycast_gun

# --- D. 後処理 ---
execute as @a[scores={sneak_timer=60..}] run scoreboard players set @s sneak_timer 0
scoreboard players set @a sneak_check 0

# ===================================================================================================================

# team players
team join player @a

# team monsters
team join monster @e[type=#mp:monsters]

# team animals
team join animal @e[team=!player,team=!monster]

# ===================================================================================================================

execute if score #GLOBAL mp_level matches 3..5 as @a at @s run effect give @e[distance=..33] glowing infinite 0 true
execute if score #GLOBAL mp_level matches 3..5 as @a at @s run effect clear @e[distance=33..] glowing
execute if score #GLOBAL mp_level matches 4.. run effect give @a speed infinite 0 true
execute if score #GLOBAL mp_level matches 6.. as @a at @s run effect give @e glowing infinite 0 true
execute if score #GLOBAL mp_level matches 2..4 run effect give @a strength infinite 0 true
execute if score #GLOBAL mp_level matches 5.. run effect give @a strength infinite 1 true
execute if score #GLOBAL mp_level matches 5.. run effect give @a fire_resistance infinite 0 true
execute if score #GLOBAL mp_level matches 7.. run effect give @e[team=!player] strength infinite 0 true

# ===================================================================================================================

# nuke検知
execute as @e[tag=nuke,tag=!summon] run scoreboard players set @s life 0
execute as @e[tag=nuke,tag=!summon] run tag @s add summon

# gun検知
execute as @e[tag=gun,tag=!summon] run scoreboard players set @s life 0
execute as @e[tag=gun,tag=!summon] run tag @s add summon

# 年齢加算
scoreboard players add @e[type=item_display] life 1

# nuke発射
execute as @e[tag=nuke,scores={life=60}] at @s run function mp:strike_nuke

# gun発射
execute as @e[tag=gun,scores={life=60}] at @s run function mp:strike_gun
execute as @e[tag=gun,scores={life=100}] at @s run function mp:kill_gun

# ===================================================================================================================
