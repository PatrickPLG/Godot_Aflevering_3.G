extends Area2D

# Laver en variable som hedder GetPlayer som henter noden Player
onready var getPlayer = $"../../Player"

func _physics_process(_delta):
	# Laver en variable kaldet bodies som finder alt der går over genstanden
	var bodies = get_overlapping_bodies()
	# For alt der går over
	for body in bodies:
		# Hvis genstanden der går over hedder Player og hvis can_damage er true
		if body.name == "Player":
			# Bruger funktionen end_game() fra spilleren til at afslutte spillet
			getPlayer.end_game()
			
func _process(delta):
	# Plusser 300 * delta og den global varible speed til x positionen
	position.x -= 300 * (delta * (GlobalSpeed.speed))
	# Hvis x mindre end -54
	if position.x < -54:
		# Fjern forhindringen
		queue_free()
	
