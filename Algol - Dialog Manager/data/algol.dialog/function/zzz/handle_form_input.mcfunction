# load active dialog ID from player storage
function algol.core:load_player_storage
data modify storage algol:zzz macro.dialog_form.id \
  set from storage algol:player_storage value."al/active_dialog"
# load and run form submission command
function algol.dialog:zzz/handle_form_input/load_and_run_command with storage algol:zzz macro.dialog_form

# reset input
scoreboard players set @s al.dialog.button 0
scoreboard players operation @s al.dialog.form_submission = @s al.dialog.form_idle_value
