# "close dialog" input
execute if score @s al.dialog.button matches -1 \
  run return run function algol.dialog:close

# form submission
execute unless score @s al.dialog.form_submission = @s al.dialog.form_idle_value \
  run return run function algol.dialog:zzz/handle_form_input

# button input
  # load button input command
    # load active dialog ID from player storage
    function algol.core:load_player_storage
    data modify storage algol:zzz macro.dialog_button.id \
      set from storage algol:player_storage value."al/active_dialog"
    # load input from score
    execute store result storage algol:zzz macro.dialog_button.input int 1 \
      run scoreboard players get @s al.dialog.button
    # call macro
    function algol.dialog:zzz/handle_input/load_command with storage algol:zzz macro.dialog_button
  # run command
  function algol.dialog:zzz/handle_input/eval with storage algol:zzz macro.eval

  # reset input
  scoreboard players set @s al.dialog.button 0
