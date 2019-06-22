extends StaticBody2D

export (String) var color;
var health = 1
var max_health
signal addScore

# preload all the powerups
var powerups = [
preload("res://Scenes/scoreup50.tscn"),
preload("res://Scenes/scoreup100.tscn"),
preload("res://Scenes/extra_ball.tscn"),
preload("res://Scenes/scoreup250.tscn"),
preload("res://Scenes/scoreup500.tscn")
]
var powerup_prob = [20, 10, 10, 8, 5]
onready var powerup_holder = get_node("/root/stage_one/GameLayer/power_holder")


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("brick")
	max_health = health
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
	game_manager.score += 10 * max_health * max_health
	s = calc_powerups()
	if s:
		s.position = position
		powerup_holder.add_child(s)
	game_manager.check_level()
	queue_free()  #destroy
	pass

func calc_powerups():
	randomize()
	var cumProb = 0
	var currentProb = int(rand_range(0, 201))
	
	for i in range(powerup_prob.size()):
		cumProb += powerup_prob[i]
		if currentProb <= cumProb:
			return powerups[i].instance()
	pass