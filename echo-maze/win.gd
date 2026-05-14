extends Node2D

func _ready():
	$PlayAgainButton.pressed.connect(_on_play_again_pressed)
	$MenuButton.pressed.connect(_on_menu_pressed)

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
