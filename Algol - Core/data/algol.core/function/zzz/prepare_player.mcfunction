# reset score
scoreboard players set @s al.zzz.leave -1

# store UUID
data modify storage algol:zzz ser.uuid set from entity @s UUID
# convert UUID to string
data modify storage algol:zzz macro.gu.UUID set from storage algol:zzz ser.uuid
function gu:convert with storage algol:zzz macro.gu

# load player score ID
data modify storage algol:zzz macro.player_id.uuid_str set from storage gu:main out
function algol.core:zzz/prepare_player/load_id with storage algol:zzz macro.player_id

# write util data to player storage
function algol.core:load_player_storage
data modify storage algol:player_storage value.uuid set from storage algol:zzz ser.uuid
data modify storage algol:player_storage value.uuid_str set from storage gu:main out

# fire event
function #algol.core:event/join
# remove tag
tag @s remove al.new
