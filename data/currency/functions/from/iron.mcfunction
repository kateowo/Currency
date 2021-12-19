# Currency IRON->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:iron_ingot"}]}] run scoreboard players set @s temp 1

# Selling
# Divide by 100, multiply by 99
execute if score @s temp matches 1.. run scoreboard players operation weight_iron global /= 100 internal
execute if score @s temp matches 1.. run scoreboard players operation weight_iron global *= 99 internal
execute if score @s temp matches 1.. unless score weight_iron global matches 1.. run scoreboard players set weight_iron global 1 

# Operations
execute if score @s temp matches 1.. run clear @s iron_ingot 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_iron global

# Error
execute if score @s temp matches 0 run tellraw @s {"text":"You do not have an Iron Ingot, operation denied.","color":"red"}

# Temp
scoreboard players set @s temp 0