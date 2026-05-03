# only reset charge if it's "resettable"
execute unless score @s al.attack_charge matches -2 \
  run scoreboard players set @s al.attack_charge 0

advancement revoke @s only algol.cat:zzz/attack
