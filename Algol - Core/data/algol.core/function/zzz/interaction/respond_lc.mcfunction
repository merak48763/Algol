scoreboard players set #is_this al.zzz 0
execute on attacker run scoreboard players set #is_this al.zzz 1
execute if score #is_this al.zzz matches 0 run return fail

# callback
function algol.core:zzz/interaction/eval with entity @s data."al/on_attack"
# remove record
data remove entity @s attack
