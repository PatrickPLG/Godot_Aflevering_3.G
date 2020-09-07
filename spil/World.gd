extends Node

const obstacle_preload = preload("res://test_enemy.tscn")
const obstacle2_preload = preload("res://test_enemy2.tscn")

var rng = RandomNumberGenerator.new()

func _on_Timer_timeout():
	var obstacle = obstacle_preload.instance()
	var obstacle2 = obstacle2_preload.instance()
	rng.randomize()
	var my_random_number = rng.randi() % 3
	if my_random_number == 1:
		obstacle.position.y = rng.randf_range(223,184.05)
		add_child(obstacle)
	else:
		obstacle2.position.y = rng.randf_range(223,184.05)
		add_child(obstacle2)


func _on_Timer_ready():
	Global.score = 0
	GlobalSpeed.speed = 1


func _on_Scoretimer_timeout():
	Global.score += 1
