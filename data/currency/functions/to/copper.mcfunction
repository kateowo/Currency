# Currency CURRENCY->COPPER


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency >= weight_copper global run scoreboard players set @s temp 1

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= weight_copper global
execute if score @s temp matches 1.. run give @s copper_ingot 1

# Error
execute if score @s temp matches 0 run tellraw @s [{"text":"You do not have $","color":"red"},{"score":{"name":"weight_copper","objective":"global"}},{"text":" available, operation denied."}]

# Temp
scoreboard players set @s temp 0