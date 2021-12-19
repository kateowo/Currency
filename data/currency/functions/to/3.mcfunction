# Currency WITHDRAW $3


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency matches 3.. run scoreboard players set @s temp 1

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= 3 internal
execute if score @s temp matches 1.. run give @s paper{display:{Name:'[{"text":"$","color":"gold","bold":true,"italic":false},{"text":"3","color":"yellow","bold":true}]',Lore:['{"text":"Currency Withdrawal","color":"gray","italic":false}']},currency:3,currency_note:true,Enchantments:[{}]} 1

# Error
execute if score @s temp matches 0 run tellraw @s {"text":"You do not have $3 available, operation denied.","color":"red"}

# Temp
scoreboard players set @s temp 0