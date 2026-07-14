# 体力回復（レベルアップ時のご褒美）
effect give @s minecraft:instant_health 1 2 true

# --------------------------------------------------
# 【レベルごとのパワーアップ設定】
# --------------------------------------------------

# レベル2：攻撃力上昇
execute if score #GLOBAL mp_level matches 2 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 2 run tellraw @s [{text:"===== LEVEL UP! =====",color:aqua,bold:1b}]
execute if score #GLOBAL mp_level matches 2 run tellraw @s [{text:"攻撃力上昇をプレゼント！",color:green,bold:true}]
execute if score #GLOBAL mp_level matches 2 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 2 run effect give @s strength infinite 0 true
execute if score #GLOBAL mp_level matches 2 run attribute @s minecraft:max_health base set 24

# レベル3：近くの敵発光
execute if score #GLOBAL mp_level matches 3 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 3 run tellraw @s [{text:"===== LEVEL UP! =====",color:aqua,bold:1b}]
execute if score #GLOBAL mp_level matches 3 run tellraw @s [{text:"近くの敵に発光をプレゼント！",color:green,bold:true}]
execute if score #GLOBAL mp_level matches 3 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 3 run attribute @s minecraft:max_health base set 28

# レベル4：スピード上昇
execute if score #GLOBAL mp_level matches 4 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 4 run tellraw @s [{text:"===== LEVEL UP! =====",color:aqua,bold:1b}]
execute if score #GLOBAL mp_level matches 4 run tellraw @s [{text:"スピード上昇をプレゼント！",color:green,bold:true}]
execute if score #GLOBAL mp_level matches 4 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 4 run attribute @s minecraft:max_health base set 32

# レベル5：さらに攻撃力上昇
execute if score #GLOBAL mp_level matches 5 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 5 run tellraw @s [{text:"===== LEVEL UP! =====",color:aqua,bold:1b}]
execute if score #GLOBAL mp_level matches 5 run tellraw @s [{text:"さらに攻撃力上昇&火炎耐性をプレゼント！",color:green,bold:true}]
execute if score #GLOBAL mp_level matches 5 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 5 run attribute @s minecraft:max_health base set 36

# レベル6：すべての敵発光
execute if score #GLOBAL mp_level matches 6 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 6 run tellraw @s [{text:"===== LEVEL UP! =====",color:aqua,bold:1b}]
execute if score #GLOBAL mp_level matches 6 run tellraw @s [{text:"すべての敵に発光をプレゼント！",color:green,bold:true}]
execute if score #GLOBAL mp_level matches 6 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 6 run attribute @s minecraft:max_health base set 42

# レベル7：金リンゴ1スタック+敵強化
execute if score #GLOBAL mp_level matches 7 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 7 run tellraw @s [{text:"===== LEVEL UP! =====",color:aqua,bold:1b}]
execute if score #GLOBAL mp_level matches 7 run tellraw @s [{text:"金リンゴ１スタックプレゼント！",color:green,bold:true}]
execute if score #GLOBAL mp_level matches 7 run tellraw @s [{text:"敵MOBに攻撃力上昇をプレゼント！",color:red,bold:true}]
execute if score #GLOBAL mp_level matches 7 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 7 run give @s golden_apple 64
execute if score #GLOBAL mp_level matches 7 run attribute @s minecraft:max_health base set 48

# レベル8：ネザライト一式
execute if score #GLOBAL mp_level matches 8 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 8 run tellraw @s [{text:"===== LEVEL UP! =====",color:aqua,bold:1b}]
execute if score #GLOBAL mp_level matches 8 run tellraw @s [{text:"ネザライト装備一式プレゼント！",color:dark_red,bold:true}]
execute if score #GLOBAL mp_level matches 8 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 8 run item replace entity @s armor.head with minecraft:netherite_helmet[enchantments={blast_protection:255,protection:4,respiration:3,aqua_affinity:1,thorns:3},equippable={slot:head,asset_id:"mp"},unbreakable={},trim={material:"minecraft:redstone",pattern:"minecraft:snout"}]
execute if score #GLOBAL mp_level matches 8 run item replace entity @s armor.chest with minecraft:netherite_chestplate[enchantments={blast_protection:255,protection:4,thorns:3},equippable={slot:chest,asset_id:"mp"},unbreakable={},trim={material:"minecraft:redstone",pattern:"minecraft:snout"}]
execute if score #GLOBAL mp_level matches 8 run item replace entity @s armor.legs with minecraft:netherite_leggings[enchantments={blast_protection:255,protection:4,thorns:3,swift_sneak:3},equippable={slot:legs,asset_id:"mp"},unbreakable={},trim={material:"minecraft:redstone",pattern:"minecraft:snout"}]
execute if score #GLOBAL mp_level matches 8 run item replace entity @s armor.feet with minecraft:netherite_boots[enchantments={depth_strider:3,soul_speed:3,blast_protection:255,protection:4,thorns:3,feather_falling:4},equippable={slot:feet,asset_id:"mp"},unbreakable={},trim={material:"minecraft:redstone",pattern:"minecraft:snout"}]
execute if score #GLOBAL mp_level matches 8 run attribute @s minecraft:max_health base set 54

# レベル9：ニュークアックス
execute if score #GLOBAL mp_level matches 9 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 9 run tellraw @s [{text:"===== LEVEL UP! =====",color:aqua,bold:1b}]
execute if score #GLOBAL mp_level matches 9 run tellraw @s [{text:"ニュークアックスプレゼント！",color:dark_red,bold:1b},{text:" (シフト3秒間で使用します)",bold:0b,color:white}]
execute if score #GLOBAL mp_level matches 9 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 9 run give @s netherite_axe[enchantments={efficiency:5,silk_touch:1},unbreakable={},custom_name={text:"ニュークアックス",color:dark_red,bold:true,italic:false}]
execute if score #GLOBAL mp_level matches 9 run attribute @s minecraft:max_health base set 60

# レベル10：レールソード
execute if score #GLOBAL mp_level matches 10 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 10 run tellraw @s [{text:"===== LEVEL UP! =====",color:aqua,bold:1b}]
execute if score #GLOBAL mp_level matches 10 run tellraw @s [{text:"レールソードプレゼント！",color:dark_red,bold:1b},{text:" (シフト3秒間で使用します)",bold:0b,color:white}]
execute if score #GLOBAL mp_level matches 10 run tellraw @s [{text:""}]
execute if score #GLOBAL mp_level matches 10 run give @s netherite_sword[enchantments={sharpness:5,sweeping_edge:3,looting:3,fire_aspect:2},unbreakable={},custom_name={text:"レールソード",color:dark_red,bold:true,italic:false}]
execute if score #GLOBAL mp_level matches 10 run attribute @s minecraft:max_health base set 80
