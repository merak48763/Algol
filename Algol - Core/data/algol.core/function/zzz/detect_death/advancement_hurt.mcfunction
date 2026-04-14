tag @s add al.this
execute unless entity @e[tag=al.this, type=player, distance=0, limit=1] run function #algol.core:event/die
tag @s remove al.this

advancement revoke @s only algol.core:zzz/hurt
