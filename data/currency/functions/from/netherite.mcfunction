# Currency NETHERITE->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:netherite_ingot"}]}] run scoreboard players set @s temp 1

# Operations
execute if score @s temp matches 1.. run clear @s netherite_ingot 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_netherite global

# Error
execute if score @s temp matches 0 run tellraw @s {"text":"You do not have a Netherite Ingot, operation denied.","color":"red"}

# Temp
scoreboard players set @s temp 0