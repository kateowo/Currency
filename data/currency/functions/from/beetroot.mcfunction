# Currency BEETROOT->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}] run scoreboard players set @s temp 1

# Selling
# Divide by 100, multiply by 99
execute if score @s temp matches 1.. run scoreboard players operation weight_beetroot global *= 99 internal
execute if score @s temp matches 1.. run scoreboard players operation weight_beetroot global /= 100 internal
execute if score @s temp matches 1.. unless score weight_beetroot global matches 1.. run scoreboard players set weight_beetroot global 1 

# Operations
execute if score @s temp matches 1.. run clear @s beetroot 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_beetroot global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Beetroot","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_beetroot","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0