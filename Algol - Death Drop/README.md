# Algol - Death Drop

Dependency: core  
This pack takes over the control of `keep_inventory` game rule.

This pack overrides the default death drop behavior.  
Items will drop at the player's last safe location, rather than always at death location.  
Dropped items are packed in a "grave" so that they don't despawn after 5 minutes.  
Interact (right click) with the grave to pop items out.

## Custom Data

### `soulbound`

- Has effect on items.
- When the value is `1b`, the item doesn't drop on death.

## Enchantment Tags

### `#algol.drop:vanishing`

- Controls whether the enchantment has vanishing curse effect.

## Event Function Tags

### `#algol.drop:check/keep_inventory`

- Called when the inventory is about to drop.
- Context: `as` and `at` the player.
- Control the death drop behavior by `return` value:
  - Return a truthy value to keep inventory.
  - Return nothing to let other functions in the tag continue the check.
  - Return a falsy value to drop inventory **immediately**.
    - Note: This is an unusual case. Use it after careful consideration!
- If the function returns a truthy value, side effects are allowed in this function.
  - Otherwise, apply side effects carefully.
