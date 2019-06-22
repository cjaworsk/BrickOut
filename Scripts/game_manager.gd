extends Node

var score = 0 setget set_score, get_score 
var ballsInPlay = 1 setget set_balls_in_play, get_balls_in_play
var ballsInHand = 2 setget set_balls_in_hand, get_balls_in_hand

var current_scene = null
var stage_num = 1
var score_label = null
var root = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	pass # Replace with function body.

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	#remove current scene
	current_scene.free()
	
	var s = ResourceLoader.load(path)
	
	# Instance the new scene.
	current_scene = s.instance()
	
	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)
	
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)

	if current_scene.name == "stage_one":
		refresh_ui()
	pass

func trigger_game_over():
	#pause game
	
	
	#log enter name if high score
	
	#goto game over scene
	
	pass

func refresh_ui():
	set_score(score)
	change_ball_label()
	pass

func check_level():
	if not current_scene.get_node("GameLayer/brick_holder").get_child_count():
		goto_scene("res://Stages/stage_one.tscn")
	pass

## ---- SCORE ---- ##
func set_score(new_value):
	score = new_value
	current_scene.get_node("UILayer/score_label").set_text("" + str(score))
	pass

func get_score():
	return score

## ---- BALLS ---- ##

func get_balls():
	return ballsInPlay + ballsInHand
	
func set_balls_in_hand(new_value):
	ballsInHand = new_value
	change_ball_label()
	pass

func get_balls_in_hand():
	return ballsInHand

func set_balls_in_play(new_value):
	ballsInPlay = new_value
	change_ball_label()
	pass

func get_balls_in_play():
	return current_scene.get_node("GameLayer/ball_holder").get_child_count()

func change_ball_label():
	var ball_amt = current_scene.get_node("UILayer/HSplitContainer/btn_ball/ball_amt")
	ball_amt.set_text("" +str(ballsInHand))
	pass