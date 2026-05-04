# remove attack speed modifier
attribute @s attack_speed modifier remove al.cat:modifier

# compute charge requirement for current attack speed
  # get attack speed
  # (+15% buffer; 1000x scaled)
  execute store result score #attack_speed al.zzz \
    run attribute @s attack_speed get 1150
  # charge requirement = (20 ticks * 1000) / (attack speed * 1000)
  scoreboard players set #requirement al.zzz 20000
  scoreboard players operation #requirement al.zzz /= #attack_speed al.zzz
# check if player is able to use current weapon
  # basic charge requirement
  execute store success score #can_attack al.zzz \
    if score @s al.attack_charge >= #requirement al.zzz
  # 0 attack speed
  execute if score #attack_speed al.zzz matches 0 \
    run scoreboard players set #can_attack al.zzz 0
  # special value for "is charged"
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
