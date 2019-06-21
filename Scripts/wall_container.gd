extends Node2D

var scn_wall = preload("res://Scenes/wall_sprite.tscn")

func _ready():
	spawn_wall()
	pass # Replace with function body.

func spawn_wall():
	#spawn down from top left
	for i in range(64):
		var wall = scn_wall.instance()
		add_child(wall)
		wall.position.x = 10
		wall.position.y = 20*i + 60
			
	#spawn right from top left
	for i in range(38):
		var wall = scn_wall.instance()
		add_child(wall)
		wall.position.x = 20*i +10
		wall.position.y = 60

	#spawn down from top right
	for i in range(64):
		var wall = scn_wall.instance()
		add_child(wall)
		wall.position.x = 750-10
		wall.position.y = 20*i + 60
	pass