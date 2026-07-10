# at 3067b7fd-0-0-0-1

# copy inventory to two chests inside a bundle
loot replace entity 3067b7fd-0-0-0-1 contents loot algol.drop:zzz/wrap_inventory
# dropped nothing -> skip all
execute as 3067b7fd-0-0-0-1 unless predicate algol.drop:zzz/hold_something run return 1

# prevent drop check
# allow side effects in the function tag
execute if function #algol.drop:check/keep_inventory run return 1

# clear inventory
clear @s *[!custom_data~{"al/soulbound": 1b}, !custom_data~{smithed: {ignore: {everything: 1b}}}]

# apply vanishing curse
item modify entity 3067b7fd-0-0-0-1 contents algol.drop:zzz/apply_vanishing
# nothing left -> don't spawn grave
execute as 3067b7fd-0-0-0-1 unless predicate algol.drop:zzz/hold_something run return 1

# place grave
  # load position
  function algol.core:load_player_storage
  data modify storage algol:zzz macro.position.dim \
    set from storage algol:player_storage value."al/death_drop_dim"
  data modify storage algol:zzz macro.position.x \
    set from storage algol:player_storage value."al/death_drop_pos"[0]
  data modify storage algol:zzz macro.position.y \
    set from storage algol:player_storage value."al/death_drop_pos"[1]
  data modify storage algol:zzz macro.position.z \
    set from storage algol:player_storage value."al/death_drop_pos"[2]

  # create entity stack
  tag @s add al.this
  summon interaction ~ ~ ~ { \
    Tags: ["al.new"], \
    data: { \
      "al/on_interact": {run: "function algol.drop:zzz/on_grave_interact"}, \
      "al/on_attack": {run: "function algol.drop:zzz/on_grave_attack"} \
    }, \
    height: .8, width: .8, response: true, Invulnerable: true, \
    Passengers: [ \
      {id: "item_display", billboard: "vertical", transformation: {translation: [0f, -.4f, 0f], scale: [.8f, .8f, .8f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}}, \
      {id: "text_display", Tags: ["al.refresh"], billboard: "vertical", text: {translate: "algol.death_drop.owner", fallback: "Items of %s", with: [{selector: "@a[tag=al.this, limit=1]"}]}, transformation: {translation: [0f, .15f, 0f], scale: [.5f, .5f, .5f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}}, \
      {id: "text_display", Tags: ["al.refresh"], billboard: "vertical", text: {translate: "algol.death_drop.pickup", fallback: "Interact to take the items"}, transformation: {translation: [0f, 0f, 0f], scale: [.5f, .5f, .5f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}} \
    ] \
  }
  tag @s remove al.this
  execute as @e[tag=al.new, type=interaction, distance=..0.01, limit=1] \
    run function algol.drop:zzz/on_death/init_grave with storage algol:zzz macro.position
