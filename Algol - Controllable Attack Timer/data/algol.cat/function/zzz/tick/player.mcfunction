# nerf non-weapon attack speed
  # detect base_attack_speed modifier
  execute store success score #has_weapon al.zzz \
    run attribute @s attack_speed modifier value get base_attack_speed
  # remove nerf
  attribute @s attack_speed modifier remove al.cat:no_weapon
  # re-apply nerf if needed
  execute if score #has_weapon al.zzz matches 0 \
    run attribute @s attack_speed modifier add al.cat:no_weapon -3 add_value

# handle tags
execute if entity @s[tag=al.cat.reset, tag=!al.cat.no_reset] \
  run function algol.cat:zzz/clear_charge
tag @s remove al.cat.reset
tag @s remove al.cat.no_reset

# increase charge by 1 tick
scoreboard players add @s al.attack_charge 1

# apply attack limit
function algol.cat:zzz/apply_limit
