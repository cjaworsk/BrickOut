extends Node

var score = 100 setget set_score, get_score 
var ballsInPlay = 0 setget set_balls_in_play, get_balls_in_play
var ballsInHand = 3 setget set_balls_in_hand, get_balls_in_hand

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
	#log and enter name if high score
	
	#go to gameover scene
	goto_scene("res://Stages/game_over.tscn")
	pass

func refresh_ui():
	set_score(score)
	change_ball_label()
	current_scene.get_node("PauseLayer/round_start/round_label").text = "ROUND " + str(stage_num)
	if stage_num == 1:
		current_scene.get_node("PauseLayer/round_start/round_label/first_round_help").visible = true
		ballsInHand = 3
		ballsInPlay = 0
		score = 100
	else:
		current_scene.get_node("PauseLayer/round_start/round_label/first_round_help").visible = false
	yield(get_tree().create_timer(1.5), "timeout")
	current_scene.get_node("PauseLayer/round_start/round_label").visible = false
	pass

func check_level():
	if current_scene.get_node("GameLayer/brick_holder").get_child_count() == 1:
		end_round()
		yield(get_tree().create_timer(1.5), "timeout")
		goto_scene("res://Stages/stage_one.tscn")
	pass

func end_round():
	current_scene.get_node("GameLayer/ball_holder").remove_balls()
	current_scene.get_node("PauseLayer/round_start/round_label").text = "ROUND CLEAR!"
	stage_num += 1
	ballsInHand += ballsInPlay
	ballsInPlay = 0
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