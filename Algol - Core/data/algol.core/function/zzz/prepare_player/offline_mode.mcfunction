# has score set & seen
  # just keep the score
  # return
  execute if score @s[tag=al.zzz.seen] al.player_id matches 1.. \
    run return 1

# otherwise treat as not seen
# (even if score is set)
  # allocate new ID
  scoreboard players operation @s al.player_id = #next al.player_id
  scoreboard players add #next al.player_id 1
  # add tags
  tag @s add al.zzz.seen
  tag @s add al.new
