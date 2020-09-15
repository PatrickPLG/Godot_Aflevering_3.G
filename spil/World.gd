extends Node

# Opretter konstanter som preloader de to fjender
const obstacle_preload = preload("res://test_enemy.tscn")
const obstacle2_preload = preload("res://test_enemy2.tscn")

# Laver en variable til at lave en randomnumbergenerator
var rng = RandomNumberGenerator.new()

# Variable spawnrate som sættes til 0
var spawnrate = 0

# Når timeren løber ud
func _on_Timer_timeout():
	# Plus 1 til spawnrate
	spawnrate += 1
	
	# Variable som opbevarer de to fjender
	var obstacle = obstacle_preload.instance()
	var obstacle2 = obstacle2_preload.instance()
	
	# Tilfældigøre randomnumbergeneratoren
	rng.randomize()
	# laver en varible som hedder my_random_number som finder et 
	# tilfældigt tal mellem 1 og 2
	var my_random_number = rng.randi() % 3
	# Hvis my_random_number lig med 1
	if my_random_number == 1:
		# Sætter obstacles y akse til en random float mellem 223 og 184.05
		obstacle.position.y = rng.randf_range(223,184.05)
		# Indsætter obstacle som child i Ysort
		$YSort.add_child(obstacle)
	# Ellers hvis my_random_number er lig med 2
	else:
		# Tilfældigøre randomnumbergeneratoren
		rng.randomize()
		# Laver en varible som hedder obst2y som finder et 
		# tilfældigt tal mellem 1 og 2
		var obst2Y = rng.randi() % 3
		# Hvis obst2Y er lig med 1
		if obst2Y == 1:
			# Sætter obstacle2s y akse til 245
			obstacle2.position.y = 245
			# Indsætter obstacle2 som child i Ysort
			$YSort.add_child(obstacle2)
		# Hvis obst2Y er lig med 2
		if obst2Y == 2:
			# Sætter obstacle2s y akse til 325
			obstacle2.position.y = 325
			# Indsætter obstacle2 som child i Ysort
			$YSort.add_child(obstacle2)
	# Hvis spawnrate er over 10
	if spawnrate > 10:
		# Sæt timerens wait_time til 2.5 sek
		$Timer.wait_time = 2.5
	# Hvis spawnrate er over 20
	if spawnrate > 20:
		# Sæt timerens wait_time til 2.25 sek
		$Timer.wait_time = 2.25
	# Hvis spawnrate er over 30
	if spawnrate > 30:
		# Sæt timerens wait_time til 2 sek
		$timer.wait_time = 2
	# Hvis spawnrate er over 40
	if spawnrate > 40:
		# Sæt timerens wait_time til 1.75 sek
		$timer.wait_time = 1.75
	# Hvis spawnrate er over 50
	if spawnrate > 50:
		# Sæt timerens wait_time til 1.5 sek
		$timer.wait_time = 1.5
	# Hvis spawnrate er over 60
	if spawnrate > 60:
		# Sæt timerens wait_time til 1.25 sek
		$timer.wait_time = 1.25
	# Hvis spawnrate er over 70
	if spawnrate > 70:
		# Sæt timerens wait_time til 1 sek
		$timer.wait_time = 1

# Når timeren er klar, sæt de gloable variabler score og speed til 0 og 1
func _on_Timer_ready():
	Global.score = 0
	GlobalSpeed.speed = 1

# Når scoreTimers tid løber ud, plus 1 til den globale variable score
func _on_Scoretimer_timeout():
	Global.score += 1
