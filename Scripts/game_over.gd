extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CenterContainer/score").text = "" + str(game_manager.score)
	pass # Replace with function body.

func _on_play_again_pressed():
	game_manager.score = 100
	game_manager.ballsInHand = 3 
	game_manager.goto_scene("res://Stages/stage_one.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
