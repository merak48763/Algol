scoreboard players set #break al.zzz 0
execute on attacker if entity @s[gamemode=creative] \
  run scoreboard players set #break al.zzz 1

# creative mode player -> break
execute if score #break al.zzz matches 1 \
  run return run function algol.fwb:zzz/break

# otherwise -> give item
execute on attacker run function algol.fwb:zzz/give_item
