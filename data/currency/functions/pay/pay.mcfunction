# Currency /trigger pay


# /trigger pay
execute as @s at @s if entity @p[distance=2..] run tellraw @s ["",{"text":"\n - CURRENCY PAY - ","color":"gold","bold":true},{"text":"\n\nYou will be giving "},{"text":"$","color":"gold","bold":true},{"score":{"name":"@s","objective":"pay"},"color":"yellow","bold":true},{"text":" to "},{"selector":"@p[distance=2..]","color":"yellow","bold":true},{"text":", continue?"},{"text":"\n\n/trigger ","color":"gray"},{"text":"confirm","color":"green"},{"text":" to finish.\n","color":"gray"}]
execute as @a at @s unless entity @p[distance=2..] run tellraw @s {"text":"No players online","color":"red"}
execute store result score @s temp_pay run scoreboard players get @s pay
scoreboard players reset @s pay