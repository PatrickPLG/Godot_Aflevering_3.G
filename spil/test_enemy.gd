extends Area2D

# Eksportere variablen damage, så man kan ændre den for hver genstand
export var damage = 50

# Laver en variable som hedder GetPlayer som henter noden Player
onready var getPlayer = $"../Player"

var can_damage = true

var speed = 1

func _physics_process(delta):
	if can_damage == true:
		# Laver en variable kaldet bodies som finder alt der går over genstanden
		var bodies = get_overlapping_bodies()
		# For alt der går over
		for body in bodies:
			# Hvis genstanden der går over hedder Player og hvis can_damage er true
			if body.name == "Player":
				# Bruger funktionen hit til at tildele skaden
				#getPlayer.hit(damage)
				getPlayer.hit(50000000)
				can_damage = false

func _process(delta):
	position.x -= 300 * (delta * (GlobalSpeed.speed))
	print(speed)
	if position.x < -54:
		queue_free()
	

func _on_Timer_timeout():
	can_damage = true


#func _on_Timer2_timeout():
	
