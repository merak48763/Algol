# creative mode player holding item -> set item
execute positioned ~ ~.25 ~ on target \
  if items entity @s[gamemode=creative] weapon.mainhand * \
  run return run item replace entity @e[tag=al.woolbox, type=item_display, distance=..0.01, limit=1] contents from entity @s weapon.mainhand

# otherwise -> give item
execute on target run function algol.fwb:zzz/give_item
