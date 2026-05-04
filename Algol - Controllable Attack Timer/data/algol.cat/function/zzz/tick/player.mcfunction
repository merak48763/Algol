# nerf non-weapon attack speed
  # detect base_attack_speed modifier
  execute store success score #has_weapon al.zzz \
    run attribute @s attack_speed modifier value get base_attack_speed
  # remove nerf
  attribute @s attack_speed modifier remove al.cat:no_weapon
  # re-apply nerf if needed
  execute if score #has_weapon al.zzz matches 0 \
    run attribute @s attack_speed modifier add al.cat:no_weapon -3 add_value

# increase charge by 1 tick
# -1 is a special case for "always ready to attack"
# -2 will be increased by 1 here (back to resettable state)
execute unless score @s al.attack_charge matches -1 \
  run scoreboard players add @s al.attack_charge 1

# apply attack limit
function algol.cat:zzz/apply_limit
