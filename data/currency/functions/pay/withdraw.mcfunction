# CURRENCY CURRENCY->NOTES


# Subtract from balance
scoreboard players operation @s currency -= @s withdraw


# Split into notes

# Hold in temp scoreboard
execute store result score @s temp_withdraw run scoreboard players get @s withdraw
# $1000
# Division (round down)
scoreboard players operation @s temp_withdraw /= 1000 internal
# Store value in scoreboard
execute store result score @s w_1000 run scoreboard players get @s temp_withdraw
# Multiply then save
scoreboard players operation @s temp_withdraw *= 1000 internal
scoreboard players operation @s withdraw -= @s temp_withdraw

# Hold in temp scoreboard
execute store result score @s temp_withdraw run scoreboard players get @s withdraw
# $500
# Divison (round down)
scoreboard players operation @s temp_withdraw /= 500 internal
# Store value in scoreboard
execute store result score @s w_500 run scoreboard players get @s temp_withdraw
# Multiply then save
scoreboard players operation @s temp_withdraw *= 500 internal
scoreboard players operation @s withdraw -= @s temp_withdraw

# Hold in temp scoreboard
execute store result score @s temp_withdraw run scoreboard players get @s withdraw
# $100
# Divison (round down)
scoreboard players operation @s temp_withdraw /= 100 internal
# Store value in scoreboard
execute store result score @s w_100 run scoreboard players get @s temp_withdraw
# Multiply then save
scoreboard players operation @s temp_withdraw *= 100 internal
scoreboard players operation @s withdraw -= @s temp_withdraw

# Hold in temp scoreboard
execute store result score @s temp_withdraw run scoreboard players get @s withdraw
# $50
# Divison (round down)
scoreboard players operation @s temp_withdraw /= 50 internal
# Store value in scoreboard
execute store result score @s w_50 run scoreboard players get @s temp_withdraw
# Multiply then save
scoreboard players operation @s temp_withdraw *= 50 internal
scoreboard players operation @s withdraw -= @s temp_withdraw

# Hold in temp scoreboard
execute store result score @s temp_withdraw run scoreboard players get @s withdraw
# $10
# Divison (round down)
scoreboard players operation @s temp_withdraw /= 10 internal
# Store value in scoreboard
execute store result score @s w_10 run scoreboard players get @s temp_withdraw
# Multiply then save
scoreboard players operation @s temp_withdraw *= 10 internal
scoreboard players operation @s withdraw -= @s temp_withdraw

# Hold in temp scoreboard
execute store result score @s temp_withdraw run scoreboard players get @s withdraw
# $5
# Divison (round down)
scoreboard players operation @s temp_withdraw /= 5 internal
# Store value in scoreboard
execute store result score @s w_5 run scoreboard players get @s temp_withdraw
# Multiply then save
scoreboard players operation @s temp_withdraw *= 5 internal
scoreboard players operation @s withdraw -= @s temp_withdraw

# Hold in temp scoreboard
execute store result score @s temp_withdraw run scoreboard players get @s withdraw
# $1
# Divison (round down)
scoreboard players operation @s temp_withdraw /= 1 internal
# Store value in scoreboard
execute store result score @s w_1 run scoreboard players get @s temp_withdraw
# Multiply then save
scoreboard players operation @s temp_withdraw *= 1 internal
scoreboard players operation @s withdraw -= @s temp_withdraw


scoreboard players reset @s withdraw