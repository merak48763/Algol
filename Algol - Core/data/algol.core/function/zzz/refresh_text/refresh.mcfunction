execute store result score #shadow al.zzz run data get entity @s shadow

# no shadow
  execute if score #shadow al.zzz matches 0 \
    run data modify entity @s shadow set value 1b
  execute if score #shadow al.zzz matches 0 \
    run return run data modify entity @s shadow set value 0b
# has shadow
  data modify entity @s shadow set value 0b
  data modify entity @s shadow set value 1b
