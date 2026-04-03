execute on attacker run tag @s add this
execute on passengers if entity @s[type=item_display] \
  run item replace entity @a[tag=this, limit=1] saddle from entity @s contents
execute on attacker run tag @s remove this

# use advancement trick to guarantee drop
execute on attacker run advancement grant @s only algol.drop:zzz/drop_from_saddle

function algol.drop:zzz/grave_cleanup
