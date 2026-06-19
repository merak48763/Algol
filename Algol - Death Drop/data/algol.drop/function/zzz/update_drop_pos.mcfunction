function algol.core:load_player_storage
execute summon marker run function algol.drop:zzz/update_drop_pos/write_pos

execute if entity @s[tag=!al.zzz.renew_dim] run return 1
tag @s remove al.zzz.renew_dim
# save dimension ID
  # shortcut for overworld
  execute if dimension overworld \
    run return run data modify storage algol:player_storage value."al/death_drop_dim" \
    set value "minecraft:overworld"
  # general case (piglin brute trick)
    # switch difficulty if needed
    execute store result score #difficulty al.zzz run difficulty
    execute if score #difficulty al.zzz matches 0 run difficulty easy
  execute positioned ~ -1000 ~ summon piglin_brute \
    run function algol.drop:zzz/update_drop_pos/write_dim
