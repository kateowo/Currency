# Currency WITHDRAW $25


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if score @s currency matches 25.. run scoreboard players set @s temp 1

# Operations
execute if score @s temp matches 1.. run scoreboard players operation @s currency -= 25 internal
execute if score @s temp matches 1.. run give @s paper{display:{Name:'[{"text":"$","color":"gold","bold":true,"italic":false},{"text":"25","color":"yellow","bold":true}]',Lore:['{"text":"Currency Withdrawal","color":"gray","italic":false}']},currency:25,currency_note:true,Enchantments:[{}]} 1

# Error
execute if score @s temp matches 0 run tellraw @s {"text":"You do not have $25 available, operation denied.","color":"red"}

# Temp
scoreboard players set @s temp 0