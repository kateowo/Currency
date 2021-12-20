# Currency REDSTONE->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:redstone"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_redstone temp 1
# Divide by 100, multiply by 99
execute if score sold_redstone temp matches 3.. run scoreboard players operation weight_redstone global *= 99 internal
execute if score sold_redstone temp matches 3.. run scoreboard players operation weight_redstone global /= 100 internal
execute if score sold_redstone temp matches 3.. unless score weight_redstone global matches 1.. run scoreboard players set weight_redstone global 1 
execute if score sold_redstone temp matches 3.. run scoreboard players reset sold_redstone temp

# Operations
execute if score @s temp matches 1.. run clear @s redstone 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_redstone global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Redstone","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_redstone","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0