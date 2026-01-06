tag @s add this
execute unless entity @e[tag=this, type=player, distance=0, limit=1] run function #algol.core:event/die
tag @s remove this

advancement revoke @s only algol.core:zzz/hurt
