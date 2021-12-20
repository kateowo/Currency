# Currency CURRENCY->OAKLOG


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency >= weight_oaklog global run scoreboard players set @s temp 1

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= weight_oaklog global
execute if score @s temp matches 1.. run give @s oak_log 1

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Bought ","color":"green"},{"text":"Oak Log","color":"yellow","bold":true},{"text":" for ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"score":{"name":"weight_oaklog","objective":"global"},"color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0