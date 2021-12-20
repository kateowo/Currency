# Currency CARROT->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_carrot temp 1
# Divide by 100, multiply by 99
execute if score sold_carrot temp matches 3.. run scoreboard players operation weight_carrot global *= 99 internal
execute if score sold_carrot temp matches 3.. run scoreboard players operation weight_carrot global /= 100 internal
execute if score sold_carrot temp matches 3.. unless score weight_carrot global matches 1.. run scoreboard players set weight_carrot global 1
execute if score sold_carrot temp matches 3.. run scoreboard players reset sold_carrot temp

# Operations
execute if score @s temp matches 1.. run clear @s carrot 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_carrot global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Carrot","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_carrot","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0