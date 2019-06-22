extends KinematicBody2D

export (Vector2) var velocity

onready var ball_holder = get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1).get_node("GameLayer/ball_holder")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
	
	if position.y > 1130:
		game_manager.ballsInPlay -= 1
		queue_free()
	pass