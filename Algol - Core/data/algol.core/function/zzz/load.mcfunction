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
forceload add -30000000 1832231
# util entities
  # item display (3067b7fd-0-0-0-1)
  summon item_display -30000000 0 1832231 {UUID: [I; 812103677,0,0,1], CustomName: "[Algol] 3067b7fd-0-0-0-1", view_range: 0}

# start schedule loop
function algol.core:zzz/refresh_text/loop
