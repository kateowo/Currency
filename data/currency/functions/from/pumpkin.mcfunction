# Currency PUMPKIN->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:pumpkin"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_pumpkin temp 1
# Divide by 100, multiply by 99
execute if score sold_pumpkin temp matches 3.. run scoreboard players operation weight_pumpkin global *= 99 internal
execute if score sold_pumpkin temp matches 3.. run scoreboard players operation weight_pumpkin global /= 100 internal
execute if score sold_pumpkin temp matches 3.. unless score weight_pumpkin global matches 1.. run scoreboard players set weight_pumpkin global 1 
execute if score sold_pumpkin temp matches 3.. run scoreboard players reset sold_pumpkin temp

# Operations
execute if score @s temp matches 1.. run clear @s pumpkin 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_pumpkin global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Pumpkin","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_pumpkin","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0