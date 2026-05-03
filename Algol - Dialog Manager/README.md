# Algol - Dialog Manager

Dependency: core

## Dialog Registry

Dialogs should be registered in storage `algol:dialog_registry`, under the root tag `value`.

### Specification

- `value`: The root tag.
  - `<id>`: A dialog. The ID can be arbitrary unique string.
    - `show`: Command to show the real dialog on screen.
    - `buttons`: Optional object mapping trigger inputs to commands.
      - `<score>`: Command to run when the trigger score `al.dialog.button` matches the score value. The score value must be positive.
    - `form_idle_value`: Score value representing "waiting for form submission". Defaults to 0.
    - `on_form_input`: Optional command to run when the trigger score `al.dialog.form_submission` doesn't match `form_idle_value`.

Commands above are run as & at the player.

## Trigger Scores

The objectives are only enabled when a dialog is opened.  
Players are unable to trigger them manually in chat.

### `al.dialog.button`

- Use this trigger for button actions on dialogs.
- Positive values trigger commands defined in the dialog registry.
- -1 closes the dialog.

### `al.dialog.form_submission`

- Use this trigger for submitting values on dialogs.

## Functions

### `algol.dialog:open`

- Open the dialog with parameter `$(id)`.
- Must be run as the player to see the dialog.

### `algol.dialog:close`

- Close any opened dialog.
- Must be run as the player to close the dialog.
