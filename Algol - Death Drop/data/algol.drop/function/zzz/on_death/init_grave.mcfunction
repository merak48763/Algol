# as grave interaction

tag @s remove al.new

# store items
execute on passengers if entity @s[type=item_display] \
  run item replace entity @s contents from entity 3067b7fd-0-0-0-1 contents

# tp
$execute in $(dim) positioned 0. 0. 0. positioned ~$(x) ~$(y) ~$(z) \
  run function algol.drop:zzz/on_death/tp_grave
