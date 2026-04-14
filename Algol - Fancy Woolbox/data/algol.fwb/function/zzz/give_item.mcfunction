# @s: player
# origin: interaction

tag @s add al.this
execute positioned ~ ~.25 ~ as @e[tag=al.woolbox, type=item_display, distance=..0.01, limit=1] \
  run loot replace entity @a[tag=al.this, limit=1] saddle loot algol.fwb:zzz/wrap_contents
tag @s remove al.this

# use advancement trick to guarantee drop
advancement grant @s only algol.fwb:zzz/drop_from_saddle
