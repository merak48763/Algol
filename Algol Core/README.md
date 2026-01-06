# Algol - Core

Dependency: none

## Entity Tags

### `al.refresh`

- Workaround for [MC-280333](https://mojira.dev/MC-280333).
- Has effect on text display.
- Update visual data every 2 seconds to refresh translated contents on client side.

## Custom Data

### `on_attack` & `on_interact`

- Has effect on interaction entity.
- Fields:
  - `run`: the command to run on attacked/interacted.

## Event Function Tags

### `#algol.core:event/join`

- Called when player joins
- Context: `as` and `at` the player
- Entity tag: `@s[tag=al.new]` if it's player's first time joining
