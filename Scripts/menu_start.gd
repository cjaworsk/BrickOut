extends Node2D

var scn_stage_one = preload("res://Stages/stage_one.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_button_button_up():
	get_tree().change_scene("res://Stages/stage_one.tscn")
	pass # Replace with function body.


func _on_quit_button_button_up():
	get_tree().quit()
	pass # Replace with function body.
