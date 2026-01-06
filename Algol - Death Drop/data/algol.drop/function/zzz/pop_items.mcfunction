execute on passengers if entity @s[type=item_display] \
  run loot spawn ~ ~ ~ loot algol.drop:zzz/pop_bundle
playsound entity.item.pickup player @a ~ ~ ~

# remove grave
execute on passengers run kill @s
kill @s
