extends Area2D

# Variablen givepoint som er true
var givepoint = true

# Eksportere variablen points, så man kan ændre den for hver genstand
export var points = 50

func _physics_process(delta):
	# Laver en variable kaldet bodies som finder alt der går over genstanden
	var bodies = get_overlapping_bodies()
	# For alt der går over
	if givepoint == true:
		for body in bodies:
			# Hvis genstanden der går over hedder Player
			if body.name == "Player":
				# Plusser 50 til den globale variable score
				Global.score += 50
				# Sætter givepoint til false
				givepoint = false
	# Hvis givepoint er false
	if givepoint == false:
		# Plus 0 til den global variable score
		Global.score += 0
