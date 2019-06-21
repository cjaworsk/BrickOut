extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("paddle")
	set_process(true)
	pass # Replace with function body.

func _physics_process(delta):
	#move the ship
	var motion = (get_global_mouse_position().x - self.position.x) *0.20
	self.translate(Vector2(motion, 0))
	
	#clamp to window
	var view = get_viewport_rect().size
	self.position.x = clamp(self.position.x , + 93, view.x - 93)
	pass
