## script: menu_start.gd
## The start menu script at beginning of the game

extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_start_button_button_up():
	#change scenes through the game_manager script
	game_manager.goto_scene("res://Stages/stage_one.tscn")
	pass # Replace with function body.

func _on_quit_button_button_up():
	get_tree().quit()
	pass # Replace with function body.
