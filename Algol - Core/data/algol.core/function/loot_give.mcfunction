# polyfills: 107.1

# $(loot): loot table ID

execute unless entity @s[type=player] run return fail

# create saddle item
item replace entity @s saddle with barrier[ \
  custom_data={smithed: {ignore: {everything: 1b}}}, \
  equippable={slot: "saddle", equip_sound: "intentionally_empty"}, \
  enchantments={binding_curse: 1, vanishing_curse: 1} \
]
$item modify entity @s saddle {type: "set_contents", component: "charged_projectiles", entries: [{type: "loot_table", value: "$(loot)"}]}

# grant advancement
advancement grant @s only algol.core:zzz/loot_give
