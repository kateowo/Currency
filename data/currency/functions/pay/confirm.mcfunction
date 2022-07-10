# Currency /trigger confirm (pay)


scoreboard players operation @s currency -= @s pay.temp
execute as @s at @s run scoreboard players operation @p[distance=2..] currency += @s pay.temp
execute as @s at @s run tellraw @p[distance=2..] [{"text":"You have been given ","color":"green"},{"text":"$","color":"gold","bold":true},{"score":{"name":"@s","objective":"pay"},"color":"yellow","bold":true}]

scoreboard players reset @s pay.temp
scoreboard players reset @s confirm