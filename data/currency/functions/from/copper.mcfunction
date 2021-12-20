# Currency COPPER->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:copper_ingot"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_copper temp 1
# Divide by 100, multiply by 99
execute if score sold_copper temp matches 3.. run scoreboard players operation weight_copper global *= 99 internal
execute if score sold_copper temp matches 3.. run scoreboard players operation weight_copper global /= 100 internal
execute if score sold_copper temp matches 3.. unless score weight_copper global matches 1.. run scoreboard players set weight_copper global 1 
execute if score sold_copper temp matches 3.. run scoreboard players reset sold_copper temp

# Operations
execute if score @s temp matches 1.. run clear @s copper_ingot 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_copper global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Copper Ingot","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_copper","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0