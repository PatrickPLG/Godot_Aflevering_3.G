extends KinematicBody2D

# Signaler
signal HP

# Konstante variabler
const UP = Vector2(0, -1)
export(int) var GRAVITY = 20
export(int) var ACCELERATION = 50
export(int) var MAX_SPEED = 200
export(int) var JUMP_HEIGHT = -400
var max_jumps = 1
var jump_count = 0
export var HP = 100

# Varible som er lig med 2d vector
var motion = Vector2()

func _physics_process(delta):
	# Plusser GRAVITY til Y aksen
	motion.y += GRAVITY
		
	# Hvis inputtet er up og at jump_count ikke er større end max_jumps
	if Input.is_action_just_pressed("ui_up") && jump_count < max_jumps:
			# Plusser JUMP_HEIGHT til motion.y som går at spriten hopper
			motion.y = JUMP_HEIGHT
			# Plusser 1 til jump_count
			jump_count += 1
	elif Input.is_action_pressed("ui_down"):
		if is_on_floor():
			$CollisionShape2D.position.y = 32
			$CollisionShape2D.rotation_degrees = 90
			$Sprite.play("Slide")
	elif Input.is_action_just_released("ui_down"):
		$Sprite.play("upSlide")
	else:
		#$Sprite.play("upSlide")
		$CollisionShape2D.position.y = 18
		$CollisionShape2D.rotation_degrees = 0
		$CollisionShape2D.position.y = 10.619
	# Hvis spriten er på jorden
	if is_on_floor():
		# Sætter jump_count til 0
		jump_count = 0
		# Hvis friction er true
	# Ellers hvis man ikke er på jorden
	else:
		# Hvis man er oppe i luften
		if motion.y < 0:
			if Input.is_action_pressed("ui_down"):
				motion.y = 50
			# Kør animationen Jump
			$Sprite.play("Jump")
		# Ellers hvis vi falder
		else:
			# Kør animationen Fall
			$Sprite.play("Fall")
	motion = move_and_slide(motion, UP)

func hit(damage):
	# Minusser HP med damage
	(Global.score) -= damage
	# Sender et signal ud som hedder HP med valuen HP
	emit_signal("HP",HP)
	# Hvis HP er mindre end 0 eller lig med 0
	if (Global.score) < 0 || (Global.score) == 0:
		# Genstarter scenen
		get_tree().reload_current_scene()
		Global.score = 0
		GlobalSpeed.speed = 1

func heal(regenerate):
	# Plusser HP med regenerate
	HP += regenerate
	# Sender et signal ud som hedder HP med valuen HP
	emit_signal("HP",HP)
	# Hvis HP er større end 100 eller lig med 100
	if HP > 100 || HP == 100:
		# Sætter HP til at være 100
		HP = 100


func _on_Sprite_animation_finished():
	if $Sprite.animation == "upSlide" || $Sprite.animation == "Fall" && is_on_floor() && $Sprite.animation == "upSlide" == false:
		$Sprite.play("Run")
