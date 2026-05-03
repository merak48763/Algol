# non-negative: regular timer
# -1: charged and can reset to 0
# -2: charged and should not reset
# The -2 trick solves the race condition issue of charging attack in advancement reward function
scoreboard objectives add al.attack_charge dummy
