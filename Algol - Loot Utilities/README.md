# Algol - Loot Utilities

Dependency: none

## Compatibility Notes

- This pack modifies vanilla block-broken loot table of containers.

## Custom Data

### `al/discard_name`

- Has effect on some container blocks, including:
  - Chest
  - Trapped chest
  - All variants of copper chest
  - Barrel
- If the value is `1b`, custom name of the block entity won't be copied when broken.
  - The whole `custom_data` component is then cleared.
- This custom data is intended to make players unable to get loot boxes using custom font GUI trick.
  - In released maps, the custom data should only exist in block component.
