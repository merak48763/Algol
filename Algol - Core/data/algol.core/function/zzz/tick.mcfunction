execute as @a unless score @s al.zzz.leave matches -1 at @s \
  run function algol.core:zzz/prepare_player

execute as @a[predicate=algol.core:zzz/respawn] at @s run function #algol.core:event/respawn
