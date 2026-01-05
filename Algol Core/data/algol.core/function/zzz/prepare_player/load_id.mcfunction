scoreboard players set @s al.player_id 0

# load from storage
$execute store result score @s al.player_id \
  run data get storage algol:zzz player_id."$(uuid_str)"
execute if score @s al.player_id matches 1.. run return 1

# allocate new ID if the record is not in storage
scoreboard players operation @s al.player_id = #next al.player_id
scoreboard players add #next al.player_id 1
$execute store result storage algol:zzz player_id."$(uuid_str)" int 1 \
  run scoreboard players get @s al.player_id
# add tag
tag @s add al.new
