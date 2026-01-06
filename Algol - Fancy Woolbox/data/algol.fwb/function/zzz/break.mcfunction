# only creative mode player can break this
execute on attacker unless entity @s[gamemode=creative] run return fail

fill ~ ~-1 ~ ~ ~1 ~ air replace bedrock destroy
execute positioned ~ ~.25 ~ run kill @e[tag=al.woolbox, type=item_display, distance=..0.01]
kill @s
