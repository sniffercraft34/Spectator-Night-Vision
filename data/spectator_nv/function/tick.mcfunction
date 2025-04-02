# Give night vision in spectator
execute as @a[gamemode=spectator,scores={spec_nv=2}] at @s run effect give @s night_vision infinite 156 true

# Clear night vision if they aren't in spectator and they have the spectator night vision effect
execute as @a[gamemode=!spectator] at @s if predicate spectator_nv:night_vision run effect clear @s night_vision

# Enable the trigger command
scoreboard players enable @a spec_nv

# Toggle messages
tellraw @a[scores={spec_nv=3}] [{"text":"Spectator Night Vision: "},{"text":"OFF","color":"red"}]
tellraw @a[scores={spec_nv=0}] [{"text":"Spectator Night Vision: "},{"text":"ON","color":"green"}]

# Toggle between ON (2) and OFF (1)
scoreboard players set @a[scores={spec_nv=0}] spec_nv 2
scoreboard players set @a[scores={spec_nv=3}] spec_nv 1

# Wrap invalid scores
scoreboard players set @a[scores={spec_nv=3..}] spec_nv 1

# Remove night vision (2)
execute as @a[scores={spec_nv=1},gamemode=spectator] at @s if predicate spectator_nv:night_vision run effect clear @s

