# reset score
scoreboard players set @s al.zzz.leave -1

# store UUID
data modify storage algol:zzz ser.uuid set from entity @s UUID
# convert UUID to string
data modify storage algol:zzz macro."gu:convert".UUID set from storage algol:zzz ser.uuid
function gu:convert with storage algol:zzz macro."gu:convert"

# load player score ID
data modify storage algol:zzz macro."algol.core:zzz/prepare_player/load_id".uuid_str set from storage gu:main out
function algol.core:zzz/prepare_player/load_id with storage algol:zzz macro."algol.core:zzz/prepare_player/load_id"

# TODO: player DB

# fire event
function #algol.core:event/join
# remove tag
tag @s remove al.new
