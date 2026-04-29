# button input
scoreboard objectives add al.dialog.button trigger
# form input
scoreboard objectives add al.dialog.form_submission trigger
# the value indicating "no form input"
scoreboard objectives add al.dialog.form_idle_value dummy

# initialize registry
data merge storage algol:dialog_registry {value: {}}
