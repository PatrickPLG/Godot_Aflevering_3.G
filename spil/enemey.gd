extends Area2D

# Eksportere variablen damage, så man kan ændre den for hver genstand
export var damage = 50

# Laver en variable som hedder GetPlayer som henter noden Player
onready var getPlayer = $"../Player"

var speed = 1

func _physics_process(_delta):
	# Laver en variable kaldet bodies som finder alt der går over genstanden
	var bodies = get_overlapping_bodies()
	# For alt der går over
	for body in bodies:
		# Hvis genstanden der går over hedder Player og hvis can_damage er true
		if body.name == "Player":
			# Bruger funktionen hit til at tildele skaden
			getPlayer.end_game()
			
func _process(delta):
	position.x -= 300 * (delta * (GlobalSpeed.speed))
	print(speed)
	if position.x < -54:
		queue_free()
	
