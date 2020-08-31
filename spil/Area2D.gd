extends Area2D

var givepoint = true

# Eksportere variablen damage, så man kan ændre den for hver genstand
export var points = 50

# Laver en variable som hedder GetPlayer som henter noden Player
onready var getPlayer = $"../Player"

func _physics_process(delta):
	# Laver en variable kaldet bodies som finder alt der går over genstanden
	var bodies = get_overlapping_bodies()
	# For alt der går over
	if givepoint == true:
		for body in bodies:
			# Hvis genstanden der går over hedder Player og hvis can_damage er true
			if body.name == "Player":
				# Bruger funktionen hit til at tildele skaden
				Global.score += 50
				givepoint = false
	if givepoint == false:
		Global.score += 0
