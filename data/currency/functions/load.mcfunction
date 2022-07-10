# Currency /reload


# Scoreboards
scoreboard objectives add internal dummy
scoreboard objectives add currency dummy
scoreboard objectives add global dummy
scoreboard objectives add temp dummy
# /trigger pay
scoreboard objectives add temp_pay dummy
scoreboard objectives add pay trigger
scoreboard objectives add confirm trigger
scoreboard objectives add withdraw trigger
scoreboard objectives add deposit trigger
scoreboard objectives add sell trigger
# Withdraw
scoreboard objectives add temp_withdraw dummy
scoreboard objectives add w_1000 dummy
scoreboard objectives add w_500 dummy
scoreboard objectives add w_100 dummy
scoreboard objectives add w_50 dummy
scoreboard objectives add w_25 dummy
scoreboard objectives add w_10 dummy
scoreboard objectives add w_5 dummy
scoreboard objectives add w_2 dummy
scoreboard objectives add w_1 dummy

# Run defaults
execute unless score defaults internal matches 1 run function currency:defaults