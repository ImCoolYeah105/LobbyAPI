
#on connect
execute unless score @s lobby_id matches 1.. run function lobby:player/join_game
execute if score @s lobby_join matches 1.. run function lobby:player/join_game

#sub main functions
execute if score state lobby_data matches 0 if entity @s[tag=!lobby_editor] run function lobby:player/in_lobby
execute if score state lobby_data matches 1 if entity @s[team=lobby,tag=!lobby_editor] run function lobby:player/in_lobby
execute if score state lobby_data matches 1 if entity @s[team=!lobby,tag=!lobby_editor] run function lobby:player/in_game

#command trigger
scoreboard players enable @s lobby
execute if score state lobby_data matches 1 if entity @s[team=!lobby] run trigger lobby set 0

execute unless score @s lobby matches 0 run function lobby:commands/main

#death handler
execute if score state lobby_data matches 1 if score game_respawn lobby_data matches 0 if score @s lobby_deaths matches 1.. run function lobby:player/join_lobby 
scoreboard players set @s lobby_deaths 0