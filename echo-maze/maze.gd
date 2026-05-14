extends Node2D

func _ready():
	create_walls()

func create_wall(x, y, w, h):
	var wall = StaticBody2D.new()
	var shape = CollisionShape2D.new()
	var rect = RectangleShape2D.new()
	var visual = ColorRect.new()
	
	rect.size = Vector2(w, h)
	shape.shape = rect
	shape.position = Vector2(w/2, h/2)
	visual.size = Vector2(w, h)
	visual.color = Color(0.2, 0.6, 1.0)
	
	wall.add_child(shape)
	wall.add_child(visual)
	wall.position = Vector2(x, y)
	add_child(wall)

func create_walls():
	# Outer walls
	create_wall(0, 0, 800, 20)      # Top
	create_wall(0, 580, 800, 20)    # Bottom
	create_wall(0, 0, 20, 600)      # Left
	create_wall(780, 0, 20, 600)    # Right
	
	# Inner maze walls
	create_wall(100, 100, 200, 20)
	create_wall(100, 100, 20, 150)
	create_wall(300, 60, 20, 150)
	create_wall(200, 200, 150, 20)
	create_wall(400, 100, 200, 20)
	create_wall(400, 100, 20, 150)
	create_wall(500, 200, 20, 150)
	create_wall(100, 300, 150, 20)
	create_wall(300, 300, 200, 20)
	create_wall(550, 280, 150, 20)
	create_wall(100, 400, 20, 150)
	create_wall(200, 400, 200, 20)
	create_wall(450, 350, 20, 150)
	create_wall(550, 400, 150, 20)
	create_wall(300, 480, 200, 20)
