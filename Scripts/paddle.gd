extends KinematicBody2D

var SMALL = 0
onready var MEDIUM = get_node("sprite").frames.get_frame("mediumpaddle", 0).get_width() * 0.2 / 2
var LARGE

func _ready():
	add_to_group("paddle")
	get_node("sprite").playing = true
	set_process(true)
	pass # Replace with function body.

func _physics_process(delta):
	#move the ship
	var motion = (get_global_mouse_position().x - self.position.x) *0.20
	self.translate(Vector2(motion, 0))
	
	#clamp to window and adjust for size of paddle
	var view = get_viewport_rect().size
	self.position.x = clamp(self.position.x , + MEDIUM + 20, view.x - MEDIUM - 20)
	pass