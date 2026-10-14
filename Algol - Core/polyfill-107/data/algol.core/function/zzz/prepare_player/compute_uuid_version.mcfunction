# UUID version = (UUID[1] >>> 12) & 0xf

execute store result score #uuid_version al.zzz \
  run data get storage algol:zzz ser.uuid[1]

# x = floorMod(x, 0x10000)
scoreboard players set #rhs al.zzz 65536
scoreboard players operation #uuid_version al.zzz %= #rhs al.zzz
execute if score #uuid_version al.zzz matches ..-1 \
  run scoreboard players add #uuid_version al.zzz 65536
# x = x >> 12
scoreboard players set #rhs al.zzz 4096
scoreboard players operation #uuid_version al.zzz /= #rhs al.zzz
