# Currency CURRENCY->MELONBLOCK


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency >= weight_melonblock global run scoreboard players set @s temp 1

# Buying
# Just add 1 if the value is under 100
execute if score @s temp matches 1.. unless score weight_melonblock global >= 100 internal run scoreboard players operation weight_melonblock global += 1 internal
# Divide by 100, multiply by 101
execute if score @s temp matches 1.. if score weight_melonblock global >= 100 internal run scoreboard players set @s temp 2
execute if score @s temp matches 1.. if score @s temp matches 2.. run scoreboard players operation weight_melonblock global *= 101 internal
execute if score @s temp matches 1.. if score @s temp matches 2.. run scoreboard players operation weight_melonblock global /= 100 internal
# If the value reaches 0, set to 1
execute if score @s temp matches 1.. unless score weight_melonblock global matches 1.. run scoreboard players set weight_melonblock global 1 

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= weight_melonblock global
execute if score @s temp matches 1.. run give @s melon 1

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Bought ","color":"green"},{"text":"Melon","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_melonblock","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0