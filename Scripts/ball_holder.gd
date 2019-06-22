extends Node2D

var ballscn = preload("res://Scenes/ball.tscn")
onready var paddle = get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1).get_node("GameLayer/paddle")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.scancode == KEY_B:
		_on_btn_ball_pressed()
	pass

## spawn a ball at the paddle's position if balls are available
func spawn_ball():
	var ball = ballscn.instance()
	ball.position.x = paddle.position.x
	ball.position.y = paddle.position.y - 20
	add_child(ball)
	game_manager.ballsInPlay += 1
	game_manager.ballsInHand -= 1
	pass

func _on_btn_ball_pressed():
	if game_manager.ballsInHand:
		spawn_ball()
	pass # Replace with function body.
