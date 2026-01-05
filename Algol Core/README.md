# Algol - Core

Dependency: none

## Entity Tags

### `al.refresh`

- Workaround for [MC-280333](https://mojira.dev/MC-280333).
- Has effect on text display.
- Update visual data every 2 seconds to refresh translated contents on client side.

## Custom Data

TODO: interaction

## Event Function Tags

### `#algol.core:event/join`

- Called when player joins
- Context: `as` and `at` the player
- Entity tag: `@s[tag=al.new]` if it's player's first time joining
