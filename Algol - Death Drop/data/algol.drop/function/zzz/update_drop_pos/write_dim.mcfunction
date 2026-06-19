# as temp piglin brute

data modify storage algol:player_storage value."al/death_drop_dim" \
  set from entity @s Brain.memories."minecraft:home".value.dimension
kill @s

# restore difficulty
execute if score #difficulty al.zzz matches 0 run difficulty peaceful
