execute if items entity @s weapon.mainhand *[consumable, custom_data~{"al/infinite": 1b}] \
  run function algol.core:zzz/infinite_consumable/toggle_hand {hand: "mainhand"}
execute if items entity @s weapon.offhand *[consumable, custom_data~{"al/infinite": 1b}] \
  run function algol.core:zzz/infinite_consumable/toggle_hand {hand: "offhand"}

advancement revoke @s only algol.core:zzz/consume_infinite_item
