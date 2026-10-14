# reset score
scoreboard players set @s al.zzz.leave -1

# invalidate GU cache
# this library isn't affected but anyways
scoreboard players reset @s gu.uuid.0

# store UUID
data modify storage algol:zzz ser.uuid set from entity @s UUID
# convert UUID to string
data modify storage algol:zzz macro.gu.UUID set from storage algol:zzz ser.uuid
function gu:convert with storage algol:zzz macro.gu
# get UUID version (write to #uuid_version score variable)
function algol.core:zzz/prepare_player/compute_uuid_version

# prepare score ID
# side effect: al.new tag is added to new player
  # UUID v4: online mode
  execute if score #uuid_version al.zzz matches 4 \
    run function algol.core:zzz/prepare_player/online_mode
  # UUID v3: offline mode
  # assumption: player's name doesn't change
  #   only serves as a safe mode for potato auth server downtime
  #   not going to support cracked version in a gazillion years
  execute unless score #uuid_version al.zzz matches 4 \
    run function algol.core:zzz/prepare_player/offline_mode

# write util data to player storage
function algol.core:load_player_storage
data modify storage algol:player_storage value.uuid set from storage algol:zzz ser.uuid
data modify storage algol:player_storage value.uuid_str set from storage gu:main out

# fire event
function #algol.core:event/join
# remove tag
tag @s remove al.new
