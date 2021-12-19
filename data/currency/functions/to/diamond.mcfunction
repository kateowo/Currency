# Currency CURRENCY->DIAMOND


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency >= weight_diamond global run scoreboard players set @s temp 1

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= weight_diamond global
execute if score @s temp matches 1.. run give @s diamond 1

# Error
execute if score @s temp matches 0 run tellraw @s [{"text":"You do not have $","color":"red"},{"score":{"name":"weight_diamond","objective":"global"}},{"text":" available, operation denied."}]

# Temp
scoreboard players set @s temp 0