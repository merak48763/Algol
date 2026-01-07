execute as @e[tag=al.spawner, tag=!al.spawner.broken, type=marker] at @s \
  unless block ~ ~ ~ spawner run function algol.spawner:zzz/spawner_broken
execute as @e[tag=al.spawner.broken, tag=al.spawner, type=marker] at @s \
  if block ~ ~ ~ spawner run tag @s remove al.spawner.broken
