extends Node

var score = 0 setget set_score, get_score 
var lives = 3 setget set_lives, get_lives

var MAX_HEALTH = 3
var stage_num = 1

var score_label = null

func _ready():
	pass # Replace with function body.

func set_score(new_value):
	score = new_value
	var root = get_tree().get_root()
	root = root.get_child(root.get_child_count()-1)
	root.get_node("UILayer/score_label").set_text("" + str(score))
	pass

func get_score():
	return score

func set_lives(new_value):
	if lives == MAX_HEALTH:
		score += 1000
	else:
		lives = new_value
	pass

func get_lives():
	return lives
