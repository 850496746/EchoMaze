extends CharacterBody2D

const SPEED = 200.0
var can_pulse = true
var pulse_cooldown = 3.0

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	direction = direction.normalized()
	velocity = direction * SPEED
	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and can_pulse:
		pulse()

func pulse():
	can_pulse = false
	# Visual pulse effect
	$Visual.modulate = Color(0, 1, 1, 0.5)
	await get_tree().create_timer(0.2).timeout
	$Visual.modulate = Color(1, 1, 1, 1)
	await get_tree().create_timer(pulse_cooldown).timeout
	can_pulse = true
