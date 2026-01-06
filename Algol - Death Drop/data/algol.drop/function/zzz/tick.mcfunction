execute as @a[predicate=algol.drop:zzz/on_ground] at @s \
  unless block ~ ~ ~ #algol.drop:unsafe \
  run function algol.drop:zzz/update_drop_pos
