# Currency WITHDRAW $2->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:paper",tag:{currency:2}}]}] run scoreboard players set @s temp 1

# Operations
execute if score @s temp matches 1.. run clear @s paper{display:{Name:'[{"text":"$","color":"gold","bold":true,"italic":false},{"text":"2","color":"yellow","bold":true}]',Lore:['{"text":"Currency Withdrawal","color":"gray","italic":false}']},currency:2,currency_note:true,Enchantments:[{}]} 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += 2 internal

# Error
execute if score @s temp matches 0 run tellraw @s {"text":"You do not have $2 withdrawed, operation denied.","color":"red"}

# Temp
scoreboard players set @s temp 0