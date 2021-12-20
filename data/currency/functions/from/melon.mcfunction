# Currency MELON->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:melon_slice"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_melon temp 1
# Divide by 100, multiply by 99
execute if score sold_melon temp matches 3.. run scoreboard players operation weight_melon global *= 99 internal
execute if score sold_melon temp matches 3.. run scoreboard players operation weight_melon global /= 100 internal
execute if score sold_melon temp matches 3.. unless score weight_melon global matches 1.. run scoreboard players set weight_melon global 1
execute if score sold_melon temp matches 3.. run scoreboard players reset sold_melon temp

# Operations
execute if score @s temp matches 1.. run clear @s melon_slice 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_melon global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Melon Slice","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_melon","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0