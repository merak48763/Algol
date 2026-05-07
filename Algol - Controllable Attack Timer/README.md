# Algol - Controllable Attack Timer

Dependency: core

Adapted from Zonglomerous Attack Timer by KVT.

This pack modifies the attack cooldown behavior.

## Behavior

### Attack cooldown

Attack cooldown only starts when the player's melee attack actually hurt something.  
This reduces the penalty of whiffing attacks and switching items.

The attack cooldown is applied by resetting the player's **attack charge** back to 0 ticks.  
Attack speed attribute controls the attack charge required to attack.  
For example, to attack with 1 attack speed, the player's attack charge must be at least 20 ticks.

### Fist attack speed

Attack speed of fist and non-weapon items is reduced to 1 (from 4).

### Invulnerability frame

Player attacks bypass invulnerability frames.  
This allows high attack speed to reach its full potential.

### Lunge

Attack cooldown starts after triggering the impulse.

## Technical Specifications

- Attack cooldown is triggered by direct attacks with `#is_player_attack` tag.
  - Riptide attack and spear charged attack will trigger cooldown. Won't fix.
- When the cooldown is applied, the player will have 0 attack speed and 0 entity interaction range.
  - This may have negative impact on some entity interaction mechanisms. Won't fix.
  - Apply `minimum_attack_charge` component on weapons with `attack_range` component to prevent the weapons from breaking the attack suppression.
- When the attack is ready, the player will receive +1000000 attack speed.
  - This is effectively constant 1024 attack speed, with a lot of margin for attack speed nerf modifiers.
- Fist and non-weapon items are distinguished by not having the `base_attack_speed` attack speed attribute modifier.
- `#is_player_attack` is added to `#bypasses_cooldown` tag.

## Functions

### `algol.cat:reset_charge`

- Reset the player's attack charge to 0.
- Must be run as a player.

### `algol.cat:charge_attack`

- Make the player able to attack immediately.
- Must be run as a player.
- Recommended to call in `post_piercing_effect` enchantment effect to prevent spamming whiffing attacks.

### `algol.cat:query_attack_speed`

- Return the player's attack speed attribute.
- Because this pack completely messes the attribute up, regular `/attribute` command is unable to query the correct attribute value.
- Must be run as a player.
- The parameter `$(scale)` specifies the scale of returned result.
