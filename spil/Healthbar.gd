extends Node

# Henter healthbaren
onready var barValue = $"Healthbar"

# Når spilleren sender HP signalet opdater HealthBaren med valuen for HP
func _on_Player_HP(HP):
	barValue.value = HP
