# Currency SUGARCANE->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:sugar_cane"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_sugarcane temp 1
# Divide by 100, multiply by 99
execute if score sold_sugarcane temp matches 3.. run scoreboard players operation weight_sugarcane global *= 99 internal
execute if score sold_sugarcane temp matches 3.. run scoreboard players operation weight_sugarcane global /= 100 internal
execute if score sold_sugarcane temp matches 3.. unless score weight_sugarcane global matches 1.. run scoreboard players set weight_sugarcane global 1 
execute if score sold_sugarcane temp matches 3.. run scoreboard players reset sold_sugarcane temp

# Operations
execute if score @s temp matches 1.. run clear @s sugar_cane 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_sugarcane global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Sugar Cane","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_sugarcane","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0