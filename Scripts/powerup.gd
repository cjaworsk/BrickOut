extends Area2D

var viewsize
var velocity

func _ready():
	randomize()
	velocity = Vector2(0, rand_range(100,250))
	viewsize = get_tree().get_root().get_visible_rect().size
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	
	if position.y > viewsize.y - 220:
		queue_free()
	pass