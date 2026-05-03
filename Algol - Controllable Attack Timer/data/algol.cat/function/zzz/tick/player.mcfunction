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

# remove attack speed modifier
attribute @s attack_speed modifier remove al.cat:modifier

# compute charge requirement for current attack speed
  # get attack speed
  # (+15% buffer; 100x scaled)
  execute store result score #attack_speed al.zzz \
    run attribute @s attack_speed get 115
  # charge requirement = (20 ticks * 100) / (attack speed * 100)
  scoreboard players set #requirement al.zzz 2000
  scoreboard players operation #requirement al.zzz /= #attack_speed al.zzz
# check if player is able to use current weapon
  execute store success score #can_attack al.zzz \
    if score @s al.attack_charge >= #requirement al.zzz
  execute if score @s al.attack_charge matches -1 \
    run scoreboard players set #can_attack al.zzz 1

# re-apply attack speed multipler
  # charged
    # very fast attack speed
    execute if score #can_attack al.zzz matches 1 \
      run attribute @s attack_speed modifier add al.cat:modifier 1000000 add_value
    # normal attack reach
    execute if score #can_attack al.zzz matches 1 \
      run return run attribute @s entity_interaction_range modifier remove al.cat:modifier
  # not charged
    # 0 attack speed
    attribute @s attack_speed modifier add al.cat:modifier -1 add_multiplied_total
    # 0 attack reach
    attribute @s entity_interaction_range modifier add al.cat:modifier -1 add_multiplied_total
