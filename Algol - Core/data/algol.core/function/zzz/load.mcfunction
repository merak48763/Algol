function gu:zzz/load

# internal variable
scoreboard objectives add al.zzz dummy
# player leave game detection
scoreboard objectives add al.zzz.leave custom:leave_game

# player ID
scoreboard objectives add al.player_id dummy
  # init #next
  execute unless score #next al.player_id matches 1.. \
    run scoreboard players set #next al.player_id 1

# util chunk
execute positioned -30000000 0 1832231 \
  run function algol.core:zzz/load/util_chunk

# start schedule loop
function algol.core:zzz/refresh_text/loop
