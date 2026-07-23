# Algol - Core

Dependency: none

## Entity Tags

### `al.refresh`

- Workaround for [MC-280333](https://mojira.dev/MC-280333).
- Has effect on text display.
- Update visual data every 2 seconds to refresh translated contents on client side.

## Custom Data

### `al/on_attack` & `al/on_interact`

- Has effect on interaction entity.
- Fields:
  - `run`: the command to run on attacked/interacted.

### `al/infinite`

- Has effect on consumable items.
- Value: `1b`
- The item will not be removed after consumed.
  - The item must not have `use_remainder` component.
  - `consume_time` must be at least 0.05 seconds.

## Player Score ID

Players have their unique ID stored in objective `al.player_id`.  
This ID is guaranteed to remain unchanged, even if the player changed name.

## Player Storage

Holds arbitrary data of each player.  
Call function `algol.core:load_player_storage` as the player before access.  
Data will be loaded to storage `algol:player_storage`, under the root tag `value`.

### Built-in data

- `uuid`: The int-array UUID of the player.
- `uuid_str`: The string UUID of the player.

## Functions

### `algol.core:load_player_storage`

- Loads per-player storage. See above.
- Must be run as the player to load storage.

### `loot_give`

- Gives the player items from loot table `$(loot)`.
  - `$(loot)` must be a valid loot table ID. Inlined form is not allowed.
- When the player's inventory is full, the items are dropped instead of discarded.
- Must be run as the player to receive the items.

## Event Function Tags

### `#algol.core:event/join`

- Called when player joins.
- Context: `as` and `at` the player.
- Entity tag: `@s[tag=al.new]` if it's player's first time joining.

### `#algol.core:event/die`

- Called when player dies.
- Context: `as` and `at` the player.

### `#algol.core:event/respawn`

- Called when player respawns.
- Context: `as` and `at` the player.

## Entity Type Tags

### `#algol.core:object_entity`

- Entity types that are not considered "alive" in common sense.
- This tag includes armor stand, despite the fact that it's technically `LivingEntity`.
