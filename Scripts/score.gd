extends Label

var score setget add_to_score

func _ready():
	score = 0
	pass # Replace with function body.

func add_to_score(new_value):
	score += new_value
	text = str(score)
	pass
