# Currency IRON->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:iron_ingot"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_iron temp 1
# Divide by 100, multiply by 99
execute if score sold_iron temp matches 3.. run scoreboard players operation weight_iron global *= 99 internal
execute if score sold_iron temp matches 3.. run scoreboard players operation weight_iron global /= 100 internal
execute if score sold_iron temp matches 3.. unless score weight_iron global matches 1.. run scoreboard players set weight_iron global 1 
execute if score sold_iron temp matches 3.. run scoreboard players reset sold_iron temp

# Operations
execute if score @s temp matches 1.. run clear @s iron_ingot 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_iron global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Iron Ingot","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_iron","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0