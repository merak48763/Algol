execute align xyz positioned ~.5 ~1.5 ~.5 \
  if entity @e[tag=al.woolbox, type=item_display, distance=..0.01, limit=1] \
  run return fail

setblock ~ ~ ~ bedrock
setblock ~ ~1 ~ glass
setblock ~ ~2 ~ bedrock
execute align xyz run summon interaction ~.5 ~1.25 ~.5 { \
  data: { \
    "al/on_interact": {run: "function algol.fwb:zzz/on_interact"}, \
    "al/on_attack": {run: "function algol.fwb:zzz/on_attack"} \
  }, \
  height: .5, width: .5, response: true, Invulnerable: true \
}
execute align xyz run summon item_display ~.5 ~1.5 ~.5 { \
  Tags: ["al.woolbox"], \
  item: {id: "stone"}, \
  transformation: {left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f], scale: [.5f, .5f, .5f], translation: [0f, 0f, 0f]}, \
  brightness: {block: 15, sky: 15}, teleport_duration: 1 \
}
