execute if score #flag/scan_spawner al.zzz matches 1 \
  run schedule function algol.spawner:zzz/scan/loop 10t replace

# update existing marker data
execute as @e[tag=al.spawner, type=marker] at @s run function algol.spawner:zzz/scan/update_marker

# look for new spawners
execute at @a run function algol.spawner:zzz/scan/search_new
