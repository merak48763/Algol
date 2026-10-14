# not seen
# (real new player or player data wiped)
  # remove data
  $execute if entity @s[tag=!al.zzz.seen] \
    run data remove storage algol:zzz player_id."$(uuid_str)"

# has storage entry
  # load from storage
  # return
  $execute if data storage algol:zzz player_id."$(uuid_str)" \
    store result score @s al.player_id \
    run return run data get storage algol:zzz player_id."$(uuid_str)"

# has score set & seen
# (the score is probably inherited from offline mode)
  # write to storage
  # return
  $execute if score @s[tag=al.zzz.seen] al.player_id matches 1.. \
    store result storage algol:zzz player_id."$(uuid_str)" int 1 \
    run return run scoreboard players get @s al.player_id

# otherwise treat as not seen
# (even if score is set)
  # allocate new ID
  scoreboard players operation @s al.player_id = #next al.player_id
  scoreboard players add #next al.player_id 1
  # write to storage
  $execute store result storage algol:zzz player_id."$(uuid_str)" int 1 \
    run scoreboard players get @s al.player_id
  # add tags
  tag @s add al.zzz.seen
  tag @s add al.new
