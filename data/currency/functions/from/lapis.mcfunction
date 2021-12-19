# Currency LAPIS->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:lapis_lazuli"}]}] run scoreboard players set @s temp 1

# Selling
# Divide by 100, multiply by 99
execute if score @s temp matches 1.. run scoreboard players operation weight_lapis global /= 100 internal
execute if score @s temp matches 1.. run scoreboard players operation weight_lapis global *= 99 internal
execute if score @s temp matches 1.. unless score weight_lapis global matches 1.. run scoreboard players set weight_lapis global 1 

# Operations
execute if score @s temp matches 1.. run clear @s lapis_lazuli 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_lapis global

# Error
execute if score @s temp matches 0 run tellraw @s {"text":"You do not have Lapis Lazuli, operation denied.","color":"red"}

# Temp
scoreboard players set @s temp 0