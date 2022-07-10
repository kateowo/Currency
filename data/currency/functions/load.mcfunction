# currency /reload


# scoreboards
scoreboard objectives add internal dummy
scoreboard objectives add currency dummy
scoreboard objectives add global dummy
scoreboard objectives add stocks dummy
scoreboard objectives add temp dummy

# /trigger pay
scoreboard objectives add pay.temp dummy
scoreboard objectives add pay trigger
scoreboard objectives add confirm trigger
scoreboard objectives add withdraw trigger
scoreboard objectives add deposit trigger
scoreboard objectives add sell trigger

# withdraw
scoreboard objectives add withdraw.temp dummy
scoreboard objectives add withdraw.1000 dummy
scoreboard objectives add withdraw.500 dummy
scoreboard objectives add withdraw.100 dummy
scoreboard objectives add withdraw.50 dummy
scoreboard objectives add withdraw.25 dummy
scoreboard objectives add withdraw.10 dummy
scoreboard objectives add withdraw.5 dummy
scoreboard objectives add withdraw.2 dummy
scoreboard objectives add withdraw.1 dummy

# Run defaults
execute unless score defaults internal matches 1 run function currency:defaults