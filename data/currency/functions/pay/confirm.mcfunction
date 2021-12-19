# Currency /trigger confirm (pay)


scoreboard players operation @s currency -= @s temp_pay
execute as @s at @s run scoreboard players operation @p[distance=2..] currency += @s temp_pay

scoreboard players reset @s temp_pay
scoreboard players reset @s confirm