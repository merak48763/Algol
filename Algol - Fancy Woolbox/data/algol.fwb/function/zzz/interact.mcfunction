# creative mode player holding item -> set item
execute positioned ~ ~.25 ~ on target \
  if items entity @s[gamemode=creative] weapon.mainhand * \
  run return run item replace entity @e[tag=al.woolbox, type=item_display, distance=..0.01, limit=1] contents from entity @s weapon.mainhand

# otherwise -> give item
execute on target run tag @s add this
execute positioned ~ ~.25 ~ as @e[tag=al.woolbox, type=item_display, distance=..0.01, limit=1] \
  run loot give @a[tag=this, limit=1] loot algol.core:drop_content_slot
execute on target run tag @s remove this
