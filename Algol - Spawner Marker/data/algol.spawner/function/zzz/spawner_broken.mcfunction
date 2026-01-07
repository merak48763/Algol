execute if predicate algol.spawner:zzz/has_broken_callback \
  run function algol.spawner:zzz/eval with entity @s data.spawner.on_broken

# no gc -> mark as broken to not trigger broken event multiple times
execute if predicate algol.spawner:zzz/no_gc \
  run return run tag @s add al.spawner.broken
# gc
kill @s
