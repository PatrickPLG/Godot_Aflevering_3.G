extends Node

const obstacle_preload = preload("res://test_enemy.tscn")
const obstacle2_preload = preload("res://test_enemy2.tscn")

var rng = RandomNumberGenerator.new()

func _on_Timer_timeout():
	var obstacle = obstacle_preload.instance()
	var obstacle2 = obstacle2_preload.instance()
	rng.randomize()
	var my_random_number = rng.randi_range(1,2)
	if my_random_number == 1:
		add_child(obstacle)
	else:
		add_child(obstacle2)
