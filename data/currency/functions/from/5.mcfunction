# Currency WITHDRAW $5->CURRENCY


# Check player is eligible for operation
scoreboard players set @s temp 0
execute if entity @s[nbt={Inventory:[{id:"minecraft:paper",tag:{currency:5}}]}] run scoreboard players set @s temp 1

# Operations
execute if score @s temp matches 1.. run clear @s paper{display:{Name:'[{"text":"$","color":"gold","bold":true,"italic":false},{"text":"5","color":"yellow","bold":true}]',Lore:['{"text":"Currency Withdrawal","color":"gray","italic":false}']},currency:5,currency_note:true,Enchantments:[{}]} 1
execute if score @s temp matches 1.. run scoreboard players operation @s currency += 5 internal

# Success
execute if score @s temp matches 1.. run tellraw @s [{"text":"Deposited ","color":"green"},{"text":"$","color":"gold","bold":true,"italic":false},{"text":"5","color":"yellow","bold":true}]

# Temp
scoreboard players set @s temp 0