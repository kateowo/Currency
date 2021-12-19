# CURRENCY DEPOSIT


function currency:from/1000
function currency:from/500
function currency:from/100
function currency:from/50
function currency:from/10
function currency:from/5
function currency:from/1

execute unless entity @s[nbt={Inventory:[{id:"minecraft:paper",tag:{currency:1}}]}] unless entity @s[nbt={Inventory:[{id:"minecraft:paper",tag:{currency:5}}]}] unless entity @s[nbt={Inventory:[{id:"minecraft:paper",tag:{currency:10}}]}] unless entity @s[nbt={Inventory:[{id:"minecraft:paper",tag:{currency:50}}]}] unless entity @s[nbt={Inventory:[{id:"minecraft:paper",tag:{currency:100}}]}] unless entity @s[nbt={Inventory:[{id:"minecraft:paper",tag:{currency:500}}]}] unless entity @s[nbt={Inventory:[{id:"minecraft:paper",tag:{currency:1000}}]}] run scoreboard players reset @s deposit