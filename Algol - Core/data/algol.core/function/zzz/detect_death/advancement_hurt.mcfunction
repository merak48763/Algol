tag @s add al.this
execute store success score #pass al.zzz \
  if entity @e[tag=al.this, type=player, distance=0, limit=1]
tag @s remove al.this

execute if score #pass al.zzz matches 0 \
  run function #algol.core:event/die

advancement revoke @s only algol.core:zzz/hurt
