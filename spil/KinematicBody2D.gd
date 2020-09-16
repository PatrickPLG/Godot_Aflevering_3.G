extends KinematicBody2D

# Konstante variabler
const UP = Vector2(0, -1)
export(int) var GRAVITY = 20
export(int) var JUMP_HEIGHT = -400
var max_jumps = 1
var jump_count = 0

# Varible som er lig med 2d vector
var motion = Vector2()

func _physics_process(delta):
	# Plusser GRAVITY til Y aksen
	motion.y += GRAVITY	
	# Hvis inputtet er up og at jump_count ikke er større end max_jumps
	if Input.is_action_just_pressed("ui_up") && jump_count < max_jumps:
			# Plusser JUMP_HEIGHT til motion.y som gør at spriten hopper
			motion.y = JUMP_HEIGHT
			# Plusser 1 til jump_count
			jump_count += 1
	# Hvis inputtet er down
	elif Input.is_action_pressed("ui_down"):
		# Hvis man er på jorden
		if is_on_floor():
			# Ændring af collisionshapen
			$CollisionShape2D.position.y = 32
			$CollisionShape2D.rotation_degrees = 90
			# Afspiller slide animationen
			$Sprite.play("Slide")
	# Hvis man lige har givet slip på down
	elif Input.is_action_just_released("ui_down"):
		# Spil upslide animationen
		$Sprite.play("upSlide")
	else:
		# Ændring af collisionshape
		$CollisionShape2D.position.y = 18
		$CollisionShape2D.rotation_degrees = 0
		$CollisionShape2D.position.y = 10.619
	# Hvis spriten er på jorden
	if is_on_floor():
		# Sætter jump_count til 0
		jump_count = 0
	else:
		# Hvis man er i luften
		if motion.y < 0:
			# Hvis inputtet er down
			if Input.is_action_pressed("ui_down"):
				# Ændry y hastigheden så man kommer hurtigere ned
				motion.y = 50
			# Kør animationen Jump
			$Sprite.play("Jump")
		# Ellers hvis man falder
		else:
			# Kør animationen Fall
			$Sprite.play("Fall")
	motion = move_and_slide(motion, UP)

func end_game():
	# Skifter over til startmenuen
	get_tree().change_scene("res://StartMenu.tscn")

func _on_Sprite_animation_finished():
	# Hvis animationen er upslide eller fall og man er på jorden og upslide er falsk
	if $Sprite.animation == "upSlide" || $Sprite.animation == "Fall" && is_on_floor() && $Sprite.animation == "upSlide" == false:
		# Kør animationen run
		$Sprite.play("Run")
