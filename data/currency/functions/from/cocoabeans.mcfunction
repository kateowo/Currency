# Currency COCOABEANS->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:cocoa_beans"}]}] run scoreboard players set @s temp 1

# Selling
execute if score @s temp matches 1.. run scoreboard players add sold_cocoabeans temp 1
# Divide by 100, multiply by 99
execute if score sold_cocoabeans temp matches 3.. run scoreboard players operation weight_cocoabeans global *= 99 internal
execute if score sold_cocoabeans temp matches 3.. run scoreboard players operation weight_cocoabeans global /= 100 internal
execute if score sold_cocoabeans temp matches 3.. unless score weight_cocoabeans global matches 1.. run scoreboard players set weight_cocoabeans global 1 
execute if score sold_cocoabeans temp matches 3.. run scoreboard players reset sold_cocoabeans temp

# Operations
execute if score @s temp matches 1.. run clear @s cocoa_beans 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += weight_cocoabeans global

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Sold ","color":"green"},{"text":"Cocoa Beans","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_cocoabeans","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0