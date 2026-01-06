execute unless entity @s[type=player] run return fail

# cache hit
execute if score #storage_cache al.player_id = @s al.player_id run return 1

# cache miss
  # write back
  execute if score #storage_cache al.player_id matches 1.. \
    store result storage algol:zzz macro.player_storage.player_id int 1 \
    run scoreboard players get #storage_cache al.player_id
  execute if score #storage_cache al.player_id matches 1.. \
    run function algol.core:zzz/player_storage/write with storage algol:zzz macro.player_storage

  # read
  data modify storage algol:player_storage value set value {}
  execute store result storage algol:zzz macro.player_storage.player_id int 1 \
    run scoreboard players get @s al.player_id
  function algol.core:zzz/player_storage/read with storage algol:zzz macro.player_storage

  # update cache ID
  scoreboard players operation #storage_cache al.player_id = @s al.player_id
