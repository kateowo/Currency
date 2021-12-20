# Currency CURRENCY->GOLD


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency >= weight_gold global run scoreboard players set @s temp 1

# Buying
execute if score @s temp matches 1.. run scoreboard players add bought_gold temp 1
# Just add 1 if the value is under 100
execute if score bought_gold temp matches 3.. unless score weight_gold global >= 100 internal run scoreboard players operation weight_gold global += 1 internal
# Divide by 100, multiply by 101
execute if score bought_gold temp matches 3.. if score weight_gold global >= 100 internal run scoreboard players set @s temp 2
execute if score bought_gold temp matches 3.. if score @s temp matches 2.. run scoreboard players operation weight_gold global *= 101 internal
execute if score bought_gold temp matches 3.. if score @s temp matches 2.. run scoreboard players operation weight_gold global /= 100 internal
# If the value reaches 0, set to 1
execute if score bought_gold temp matches 3.. unless score weight_gold global matches 1.. run scoreboard players set weight_gold global 1 
execute if score bought_gold temp matches 3.. run scoreboard players reset bought_gold temp

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= weight_gold global
execute if score @s temp matches 1.. run give @s gold_ingot 1

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Bought ","color":"green"},{"text":"Gold Ingot","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_gold","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0