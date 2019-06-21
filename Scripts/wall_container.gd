extends Node2D

var scn_wall = preload("res://Scenes/wall_sprite.tscn")

func _ready():
	spawn_wall()
	pass # Replace with function body.

func spawn_wall():
	#spawn down from top left
	for i in range(34):
		var wall = scn_wall.instance()
		add_child(wall)
		wall.position.x = 13
		wall.position.y = 25*i + 60
			
	#spawn right from top left
	for i in range(40):
		var wall = scn_wall.instance()
		add_child(wall)
		wall.position.x = 25*i +13
		wall.position.y = 60

	#spawn down from top right
	for i in range(34):
		var wall = scn_wall.instance()
		add_child(wall)
		wall.position.x = 1000-13
		wall.position.y = 26*i + 60
	pass