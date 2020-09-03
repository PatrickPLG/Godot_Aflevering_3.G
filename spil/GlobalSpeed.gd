extends Node

var speed = 1

var can_spawn = true

func _on_Timer_timeout():
	speed = speed / 0.95
