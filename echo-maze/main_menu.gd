extends Node2D

func _ready():
	$StartButton.pressed.connect(_on_start_pressed)
	$CreditsButton.pressed.connect(_on_credits_pressed)
	$QuitButton.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Credits.tscn")

func _on_quit_pressed():
	get_tree().quit()
	
