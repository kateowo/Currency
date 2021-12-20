# Currency CURRENCY->COPPER


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency >= weight_copper global run scoreboard players set @s temp 1

# Buying
execute if score @s temp matches 1.. run scoreboard players add bought_copper temp 1
# Just add 1 if the value is under 100
execute if score bought_copper temp matches 3.. unless score weight_copper global >= 100 internal run scoreboard players operation weight_copper global += 1 internal
# Divide by 100, multiply by 101
execute if score bought_copper temp matches 3.. if score weight_copper global >= 100 internal run scoreboard players set @s temp 2
execute if score bought_copper temp matches 3.. if score @s temp matches 2.. run scoreboard players operation weight_copper global *= 101 internal
execute if score bought_copper temp matches 3.. if score @s temp matches 2.. run scoreboard players operation weight_copper global /= 100 internal
# If the value reaches 0, set to 1
execute if score bought_copper temp matches 3.. unless score weight_copper global matches 1.. run scoreboard players set weight_copper global 1 
execute if score bought_copper temp matches 3.. run scoreboard players reset bought_copper temp

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= weight_copper global
execute if score @s temp matches 1.. run give @s copper_ingot 1

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Bought ","color":"green"},{"text":"Copper Ingot","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_copper","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0