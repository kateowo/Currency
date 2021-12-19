# Currency SUGARCANE->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:sugar_cane"}]}] run scoreboard players set @s temp 1

# Selling
# Divide by 100, multiply by 99
execute if score @s temp matches 1.. run scoreboard players operation weight_sugarcane global /= 100 internal
execute if score @s temp matches 1.. run scoreboard players operation weight_sugarcane global *= 99 internal
execute if score @s temp matches 1.. unless score weight_sugarcane global matches 1.. run scoreboard players set weight_sugarcane global 1 

# Operations
execute if score @s temp matches 1.. run clear @s sugar_cane 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_sugarcane global

# Error
execute if score @s temp matches 0 run tellraw @s {"text":"You do not have Sugar Cane, operation denied.","color":"red"}

# Temp
scoreboard players set @s temp 0