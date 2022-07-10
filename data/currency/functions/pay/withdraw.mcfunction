# CURRENCY CURRENCY->NOTES


# Subtract from balance
scoreboard players operation @s currency -= @s withdraw


# Split into notes

# Hold in temp scoreboard
execute store result score @s withdraw.temp run scoreboard players get @s withdraw
# $1000
# Division (round down)
scoreboard players operation @s withdraw.temp /= 1000 internal
# Store value in scoreboard
execute store result score @s withdraw.1000 run scoreboard players get @s withdraw.temp
# Multiply then save
scoreboard players operation @s withdraw.temp *= 1000 internal
scoreboard players operation @s withdraw -= @s withdraw.temp

# Hold in temp scoreboard
execute store result score @s withdraw.temp run scoreboard players get @s withdraw
# $500
# Divison (round down)
scoreboard players operation @s withdraw.temp /= 500 internal
# Store value in scoreboard
execute store result score @s withdraw.500 run scoreboard players get @s withdraw.temp
# Multiply then save
scoreboard players operation @s withdraw.temp *= 500 internal
scoreboard players operation @s withdraw -= @s withdraw.temp

# Hold in temp scoreboard
execute store result score @s withdraw.temp run scoreboard players get @s withdraw
# $100
# Divison (round down)
scoreboard players operation @s withdraw.temp /= 100 internal
# Store value in scoreboard
execute store result score @s withdraw.100 run scoreboard players get @s withdraw.temp
# Multiply then save
scoreboard players operation @s withdraw.temp *= 100 internal
scoreboard players operation @s withdraw -= @s withdraw.temp

# Hold in temp scoreboard
execute store result score @s withdraw.temp run scoreboard players get @s withdraw
# $50
# Divison (round down)
scoreboard players operation @s withdraw.temp /= 50 internal
# Store value in scoreboard
execute store result score @s withdraw.50 run scoreboard players get @s withdraw.temp
# Multiply then save
scoreboard players operation @s withdraw.temp *= 50 internal
scoreboard players operation @s withdraw -= @s withdraw.temp

# Hold in temp scoreboard
execute store result score @s withdraw.temp run scoreboard players get @s withdraw
# $10
# Divison (round down)
scoreboard players operation @s withdraw.temp /= 10 internal
# Store value in scoreboard
execute store result score @s withdraw.10 run scoreboard players get @s withdraw.temp
# Multiply then save
scoreboard players operation @s withdraw.temp *= 10 internal
scoreboard players operation @s withdraw -= @s withdraw.temp

# Hold in temp scoreboard
execute store result score @s withdraw.temp run scoreboard players get @s withdraw
# $5
# Divison (round down)
scoreboard players operation @s withdraw.temp /= 5 internal
# Store value in scoreboard
execute store result score @s withdraw.5 run scoreboard players get @s withdraw.temp
# Multiply then save
scoreboard players operation @s withdraw.temp *= 5 internal
scoreboard players operation @s withdraw -= @s withdraw.temp

# Hold in temp scoreboard
execute store result score @s withdraw.temp run scoreboard players get @s withdraw
# $1
# Divison (round down)
scoreboard players operation @s withdraw.temp /= 1 internal
# Store value in scoreboard
execute store result score @s withdraw.1 run scoreboard players get @s withdraw.temp
# Multiply then save
scoreboard players operation @s withdraw.temp *= 1 internal
scoreboard players operation @s withdraw -= @s withdraw.temp


scoreboard players reset @s withdraw