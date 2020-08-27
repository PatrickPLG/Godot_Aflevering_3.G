#WorldComplete.gd
extends Area2D
var timer = null
var can_damage = true

# Eksportere variablen damage, så man kan ændre den for hver genstand
export var damage = 15

# Laver en variable som hedder GetPlayer som henter noden Player
onready var getPlayer = $"../Player"

func _ready():
	# Laver en ny timer til delay mellem skaden fra ilden
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.2)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)

func _physics_process(delta):
	# Laver en variable kaldet bodies som finder alt der går over genstanden
	var bodies = get_overlapping_bodies()
	# For alt der går over
	for body in bodies:
		# Hvis genstanden der går over hedder Player og hvis can_damage er true
		if body.name == "Player" and can_damage:
			# Bruger funktionen hit til at tildele skaden
			getPlayer.hit(damage)
			# Sætter can_damage til false
			can_damage = false
			# Starter timeren
			timer.start()

# Når timerenes timeout er færdig
func on_timeout_complete():
	# Sætter can_damage til true
	can_damage = true
