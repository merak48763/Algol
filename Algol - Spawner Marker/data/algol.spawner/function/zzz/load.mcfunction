scoreboard objectives add al.spawner_command dummy
# init #next
  execute unless score #next al.spawner_command matches 1.. \
    run scoreboard players set #next al.spawner_command 1

# enable by default
execute unless score #flag/scan_spawner al.zzz matches 0..1 \
  run scoreboard players set #flag/scan_spawner al.zzz 1

# start schedule loop
execute if score #flag/scan_spawner al.zzz matches 1 \
  run function algol.spawner:zzz/scan/loop
