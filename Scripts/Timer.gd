extends Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("timeout", self, "_on_Timer_timeout")
	set_wait_time(0.1)
	set_one_shot(false) # Make sure it loops
	start()
	pass
	
func _on_Timer_timeout():
	game_manager.score -= 1
	pass
