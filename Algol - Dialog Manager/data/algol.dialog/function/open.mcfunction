# $(id): dialog registry key

# guards
  # context guard
  execute unless entity @s[type=player] run return fail
  # registry guard
  $execute unless data storage algol:dialog_registry value.$(id).show run return fail

# show dialog
$function algol.dialog:zzz/open/eval with storage algol:dialog_registry value.$(id)

# record active dialog ID
function algol.core:load_player_storage
$data modify storage algol:player_storage value."al/active_dialog" set value "$(id)"

# add tag
tag @s add al.dialog_open

# initialize input trigger
  # enable trigger
  scoreboard players enable @s al.dialog.button
  scoreboard players enable @s al.dialog.form_submission
  # reset score value
    # button input value
    scoreboard players set @s al.dialog.button 0
    # form submission value
    $execute store result score @s al.dialog.form_idle_value \
      run data get storage algol:dialog_registry value.$(id).form_idle_value
    scoreboard players operation @s al.dialog.form_submission = @s al.dialog.form_idle_value
