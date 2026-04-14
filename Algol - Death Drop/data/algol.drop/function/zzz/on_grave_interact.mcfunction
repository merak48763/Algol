execute on target run tag @s add al.this
execute on passengers if entity @s[type=item_display] \
  run item replace entity @a[tag=al.this, limit=1] saddle from entity @s contents
execute on target run tag @s remove al.this

# use advancement trick to guarantee drop
execute on target run advancement grant @s only algol.drop:zzz/drop_from_saddle

function algol.drop:zzz/grave_cleanup
