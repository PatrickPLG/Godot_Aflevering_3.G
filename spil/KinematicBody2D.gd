extends KinematicBody2D

# Signaler
signal HP

# Konstante variabler
const UP = Vector2(0, -1)
export(int) var GRAVITY = 20
export(int) var ACCELERATION = 50
export(int) var MAX_SPEED = 200
export(int) var JUMP_HEIGHT = -550
var max_jumps = 1
var jump_count = 0
export var HP = 100

# Varible som er lig med 2d vector
var motion = Vector2()

func _physics_process(delta):
	# Plusser GRAVITY til Y aksen
	motion.y += GRAVITY
	# Sætter variablen friction til false
	var friction = false
	
	# Hvis input er piletasten til højre
	if Input.is_action_pressed("ui_right"):
		# Sætter hastigheden til motion.x + ACCELERATION og max hastigheden
		# Til MAX_SPEED
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		# Flipper ikke spriten
		$Sprite.flip_h = false
		# Kører animationen Run
		$Sprite.play("Run")
	# Hvis input er piletasten til venstre
	elif Input.is_action_pressed("ui_left"):
		# Sætter hastigheden til motion.x - ACCELERATION og max hastigheden
		# Til -MAX_SPEED
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		# Flipper spriten
		$Sprite.flip_h = true
		# Kører animationen Run
		$Sprite.play("Run")
	# Ellers hvis der ikke er nogle input
	else:
		# Kør animationen idle
		$Sprite.play("idle")
		# Sætter friction til true
		friction = true
		# Laver friktion, hvor vi først angiver vores nuværende hastighed
		# Derefter hvor langt vi vil ned i fart og derefter procenten af
		# Hvor hurtigt det skal tage at komme ned til 0
		motion.x = lerp(motion.x, 0, 0.2)
		
	# Hvis inputtet er up og at jump_count ikke er større end max_jumps
	if Input.is_action_just_pressed("ui_up") && jump_count < max_jumps:
			# Plusser JUMP_HEIGHT til motion.y som går at spriten hopper
			motion.y = JUMP_HEIGHT
			# Plusser 1 til jump_count
			jump_count += 1
	# Hvis spriten er på jorden
	if is_on_floor():
		# Sætter jump_count til 0
		jump_count = 0
		# Hvis friction er true
		if friction == true:
			# Lav friktion
			motion.x = lerp(motion.x, 0, 0.2)
	# Ellers hvis man ikke er på jorden
	else:
		# Hvis man er oppe i luften
		if motion.y < 0:
			# Kør animationen Jump
			$Sprite.play("Jump")
		# Ellers hvis vi falder
		else:
			# Kør animationen Fall
			$Sprite.play("Fall")
		# Hvis friction er true
		if friction == true:
			# Lav friktion, hvor procenten er sat ned til 0.05
			motion.x = lerp(motion.x, 0, 0.05)
	motion = move_and_slide(motion, UP)
	pass

func hit(damage):
	# Minusser HP med damage
	HP -= damage
	# Sender et signal ud som hedder HP med valuen HP
	emit_signal("HP",HP)
	# Hvis HP er mindre end 0 eller lig med 0
	if HP < 0 || HP == 0:
		# Genstarter scenen
		get_tree().reload_current_scene()

func heal(regenerate):
	# Plusser HP med regenerate
	HP += regenerate
	# Sender et signal ud som hedder HP med valuen HP
	emit_signal("HP",HP)
	# Hvis HP er større end 100 eller lig med 100
	if HP > 100 || HP == 100:
		# Sætter HP til at være 100
		HP = 100
	
