extends Node2D

var ballscn = preload("res://Scenes/ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("left_click"):
		spawn_ball()
	pass

func spawn_ball():
	var ball = ballscn.instance()
	ball.position = get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1).get_node("GameLayer/paddle").position
	add_child(ball)
	pass