# Currency CACTUS->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:cactus"}]}] run scoreboard players set @s temp 1

# Selling
# Divide by 100, multiply by 99
execute if score @s temp matches 1.. run scoreboard players operation weight_cactus global /= 100 internal
execute if score @s temp matches 1.. run scoreboard players operation weight_cactus global *= 99 internal
execute if score @s temp matches 1.. unless score weight_cactus global matches 1.. run scoreboard players set weight_cactus global 1 

# Operations
execute if score @s temp matches 1.. run clear @s cactus 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_cactus global

# Error
execute if score @s temp matches 0 run tellraw @s {"text":"You do not have a Cactus, operation denied.","color":"red"}

# Temp
scoreboard players set @s temp 0