
execute if score state lobby_data matches 0 run function lobby:commands/main_lobby
execute if score state lobby_data matches 1 if entity @s[team=lobby] run function lobby:commands/main_game

scoreboard players set @s lobby 0