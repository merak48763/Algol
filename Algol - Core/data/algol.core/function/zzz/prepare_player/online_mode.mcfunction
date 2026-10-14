# load or init player score ID
data modify storage algol:zzz macro.player_id.uuid_str set from storage gu:main out
function algol.core:zzz/prepare_player/online_mode/load_id with storage algol:zzz macro.player_id
