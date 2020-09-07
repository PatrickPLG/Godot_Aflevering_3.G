extends Area2D

onready var getPlayer = $"../Player"


func _physics_process(delta):
	# Laver en variable kaldet bodies som finder alt der går over genstanden
	var bodies = get_overlapping_bodies()
	# For alt der går over
	for body in bodies:
		# Hvis genstanden der går over hedder Player og hvis can_damage er true
		if body.name == "Player":
			# Bruger funktionen hit til at tildele skaden
			getPlayer.end_game()
