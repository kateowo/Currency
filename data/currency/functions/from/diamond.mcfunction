# Currency DIAMOND->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:diamond"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_diamond temp 1
# Divide by 100, multiply by 99
execute if score sold_diamond temp matches 3.. run scoreboard players operation weight_diamond global *= 99 internal
execute if score sold_diamond temp matches 3.. run scoreboard players operation weight_diamond global /= 100 internal
execute if score sold_diamond temp matches 3.. unless score weight_diamond global matches 1.. run scoreboard players set weight_diamond global 1 
execute if score sold_diamond temp matches 3.. run scoreboard players reset sold_diamond temp

# Operations
execute if score @s temp matches 1.. run clear @s diamond 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_diamond global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Diamond","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_diamond","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0