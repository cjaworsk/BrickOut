extends "res://Scripts/powerup.gd"

var scoreNode
export (int) var score

func _ready():
	connect("body_entered", self, "_on_body_entered")
	scoreNode = get_node("/root/stage_one/Panel/score")
	pass # Replace with function body.

func _on_body_entered(other):
	if other.is_in_group("paddle"):
		scoreNode.score = score
		queue_free()
	pass