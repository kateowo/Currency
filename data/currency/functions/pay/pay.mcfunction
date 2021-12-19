# Currency /trigger pay


# /trigger pay
execute as @s at @s run tellraw @s ["",{"text":"\n - CURRENCY TRADE - ","color":"gold","bold":true},{"text":"\n\nYou will be trading "},{"text":"$","color":"gold","bold":true},{"score":{"name":"@s","objective":"pay"},"color":"yellow","bold":true},{"text":" with "},{"selector":"@p[distance=2..]","color":"yellow","bold":true},{"text":", continue?"},{"text":"\n\n/trigger ","color":"gray"},{"text":"confirm","color":"green"},{"text":"/","color":"gray"},{"text":"cancel\n","color":"red"}]
execute store result score @s temp_pay run scoreboard players get @s pay
scoreboard players reset @s pay