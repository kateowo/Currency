# Currency main loop


# Display on actionbar
execute as @a if score display global matches 1 unless score @s currency matches 1.. run title @s actionbar [{"text":"$","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"currency"},"color":"gray","bold":true}]
execute as @a if score display global matches 1 if score @s currency matches 1.. unless score @s currency matches 5000.. unless score @s currency matches 10000.. run title @s actionbar [{"text":"$","color":"gold","bold":true},{"score":{"name":"@s","objective":"currency"},"color":"yellow","bold":true}]
execute as @a if score display global matches 1 if score @s currency matches 5000.. unless score @s currency matches 10000.. run title @s actionbar [{"text":"$","color":"green","bold":true},{"score":{"name":"@s","objective":"currency"},"color":"yellow","bold":true}]
execute as @a if score display global matches 1 if score @s currency matches 10000.. run title @s actionbar [{"text":"$","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"currency"},"color":"yellow","bold":true}]
# Set $ to 0 if no value is present
execute as @a unless score @s currency matches 0.. run scoreboard players set @s currency 0

# /trigger pay
execute as @a if score @s pay matches 1.. run function currency:pay/pay
execute as @a if score @s confirm matches 1.. run function currency:pay/confirm
# Withdraw
execute as @a if score @s withdraw matches 1.. if score @s withdraw <= @s currency run function currency:pay/withdraw
execute as @a if score @s withdraw matches 1.. unless score @s withdraw <= @s currency run tellraw @s {"text":"Insufficient funds.","color":"red"}
execute as @a if score @s withdraw matches 1.. unless score @s withdraw <= @s currency run scoreboard players reset @s withdraw
# Deposit
execute as @a if score @s deposit matches 1.. run function currency:pay/deposit
# Enable triggers
scoreboard players enable @a pay
scoreboard players enable @a confirm
scoreboard players enable @a deposit
scoreboard players enable @a withdraw
scoreboard players enable @a sell

# Selling
execute as @a if score @s sell matches 1.. unless score disabled global matches 1.. run function currency:pay/sell
# Repeats
execute as @a if score @s sell matches 1.. unless score disabled global matches 1.. unless entity @s[nbt={SelectedItem:{id:"minecraft:coal"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:melon"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:quartz"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:cocoa_beans"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:beetroot"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:carrot"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:potato"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:brown_mushroom"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:cactus"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:copper_ingot"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:diamond"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:gold_ingot"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:iron_ingot"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:lapis_lazuli"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:melon_slice"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:netherite_scrap"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:nether_wart"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:pumpkin"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:red_mushroom"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:redstone"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:sugar_cane"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:wheat"}}] run scoreboard players reset @s sell
execute as @a if score @s sell matches 2.. unless score disabled global matches 1.. run function currency:pay/sell_items

# Withdraw
execute as @a if score @s withdraw.1000 matches 1.. run function currency:give/1000
execute as @a if score @s withdraw.500 matches 1.. run function currency:give/500
execute as @a if score @s withdraw.100 matches 1.. run function currency:give/100
execute as @a if score @s withdraw.50 matches 1.. run function currency:give/50
execute as @a if score @s withdraw.10 matches 1.. run function currency:give/10
execute as @a if score @s withdraw.5 matches 1.. run function currency:give/5
execute as @a if score @s withdraw.1 matches 1.. run function currency:give/1