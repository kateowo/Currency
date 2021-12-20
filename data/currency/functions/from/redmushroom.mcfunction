# Currency REDMUSHROOM->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:red_mushroom"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_redmushroom temp 1
# Divide by 100, multiply by 99
execute if score sold_redmushroom temp matches 3.. run scoreboard players operation weight_redmushroom global *= 99 internal
execute if score sold_redmushroom temp matches 3.. run scoreboard players operation weight_redmushroom global /= 100 internal
execute if score sold_redmushroom temp matches 3.. unless score weight_redmushroom global matches 1.. run scoreboard players set weight_redmushroom global 1 
execute if score sold_redmushroom temp matches 3.. run scoreboard players reset sold_redmushroom temp

# Operations
execute if score @s temp matches 1.. run clear @s red_mushroom 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_redmushroom global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Red Mushroom","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_redmushroom","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0