# Currency main loop


# Display on actionbar
execute as @a if score display global matches 1 run title @s actionbar [{"text":"$","color":"gold","bold":true},{"score":{"name":"@s","objective":"currency"},"color":"yellow","bold":true}]
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

# Withdraw
execute as @a if score @s w_1000 matches 1.. run function currency:give/1000
execute as @a if score @s w_500 matches 1.. run function currency:give/500
execute as @a if score @s w_100 matches 1.. run function currency:give/100
execute as @a if score @s w_50 matches 1.. run function currency:give/50
execute as @a if score @s w_10 matches 1.. run function currency:give/10
execute as @a if score @s w_5 matches 1.. run function currency:give/5
execute as @a if score @s w_1 matches 1.. run function currency:give/1