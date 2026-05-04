# $(scale): the scale of attribute value

execute unless entity @s[type=player] run return fail

# remove attack speed modifier
attribute @s attack_speed modifier remove al.cat:modifier

# query attribute
$execute store result score #query al.zzz \
  run attribute @s attack_speed get $(scale)

# apply attack limit
function algol.cat:zzz/apply_limit

# return result
return run scoreboard players get #query al.zzz
