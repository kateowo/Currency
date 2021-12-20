# Currency CURRENCY->QUARTZ


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency >= weight_quartz global run scoreboard players set @s temp 1

# Buying
execute if score @s temp matches 1.. run scoreboard players add bought_quartz temp 1
# Just add 1 if the value is under 100
execute if score bought_quartz temp matches 3.. unless score weight_quartz global >= 100 internal run scoreboard players operation weight_quartz global += 1 internal
# Divide by 100, multiply by 101
execute if score bought_quartz temp matches 3.. if score weight_quartz global >= 100 internal run scoreboard players set @s temp 2
execute if score bought_quartz temp matches 3.. if score @s temp matches 2.. run scoreboard players operation weight_quartz global *= 101 internal
execute if score bought_quartz temp matches 3.. if score @s temp matches 2.. run scoreboard players operation weight_quartz global /= 100 internal
# If the value reaches 0, set to 1
execute if score bought_quartz temp matches 3.. unless score weight_quartz global matches 1.. run scoreboard players set weight_quartz global 1 
execute if score bought_quartz temp matches 3.. run scoreboard players reset bought_quartz temp

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= weight_quartz global
execute if score @s temp matches 1.. run give @s quartz 1

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Bought ","color":"green"},{"text":"Quartz","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_quartz","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0