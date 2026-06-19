# guards
  # context guard
  execute unless entity @s[type=player] run return fail

# clear dialog
dialog clear @s

# remove active dialog ID
function algol.core:load_player_storage
data remove storage algol:player_storage value."al/active_dialog"

# remove tag
tag @s remove al.dialog.open

# reset input trigger
scoreboard players reset @s al.dialog.button
scoreboard players reset @s al.dialog.form_submission
