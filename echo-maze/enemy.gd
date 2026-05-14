extends CharacterBody2D

const SPEED = 100.0
var player = null
var patrol_direction = Vector2(1, 0)
var patrol_timer = 0.0
var chase_mode = false

func _ready():
	player = get_parent().get_node("Player")

func _physics_process(delta):
	if player == null:
		return
	
	var distance = global_position.distance_to(player.global_position)
	
	if distance < 200:
		chase_mode = true
	else:
		chase_mode = false
	
	if chase_mode:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED
	else:
		patrol_timer += delta
		if patrol_timer > 2.0:
			patrol_timer = 0.0
			patrol_direction = Vector2(
				randf_range(-1, 1),
				randf_range(-1, 1)
			).normalized()
		velocity = patrol_direction * SPEED
	
	move_and_slide()

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Lose.tscn")


func _on_detection_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
