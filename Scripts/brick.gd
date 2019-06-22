extends StaticBody2D

export (String) var color;
var health = 1
signal addScore

# preload all the powerups
var scoreups = [
preload("res://Scenes/scoreup50.tscn"),
preload("res://Scenes/scoreup100.tscn"),
preload("res://Scenes/scoreup250.tscn"),
preload("res://Scenes/scoreup500.tscn")
]
var scoreup_prob = [30, 15, 10, 5]
onready var powerup_holder = get_node("/root/stage_one/GameLayer/power_holder")


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("brick")
	pass # Replace with function body.

func hit():
	if health > 1: #if bricks have two lives
		health -= 1
		get_node("half_health").visible = true
		get_node("max_health").visible = false
	else: #otherwise destroy upon being hit
		health = 0
		break_brick()
	pass
	
func break_brick():
	var s
	#add 10 per brick
	game_manager.score += 10
	emit_signal("addScore")
	s = calc_powerups()
	if s:
		s.position = position
		powerup_holder.add_child(s)
	queue_free()  #destroy
	pass

func calc_powerups():
	randomize()
	var cumProb = 0
	var currentProb = int(rand_range(0, 101))
	
	for i in range(scoreup_prob.size()):
		cumProb += scoreup_prob[i]
		if currentProb <= cumProb:
			return scoreups[i].instance()
	pass