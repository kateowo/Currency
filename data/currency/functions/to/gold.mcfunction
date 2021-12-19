# Currency CURRENCY->GOLD


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency >= weight_gold global run scoreboard players set @s temp 1

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= weight_gold global
execute if score @s temp matches 1.. run give @s gold_ingot 1

# Error
execute if score @s temp matches 0 run tellraw @s [{"text":"You do not have $","color":"red"},{"score":{"name":"weight_gold","objective":"global"}},{"text":" available, operation denied."}]

# Temp
scoreboard players set @s temp 0