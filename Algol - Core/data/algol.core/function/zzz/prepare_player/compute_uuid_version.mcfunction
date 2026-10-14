# polyfills: 107.1

# UUID version = (UUID[1] >>> 12) & 0xf

execute store result score #uuid_version al.zzz \
  run compute default integer algol.core:zzz/uuid_version
