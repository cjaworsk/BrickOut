extends Node2D

export (int) var width
export (int) var height
export (int) var x_start
export (int) var y_start
export (int) var x_offset
export (int) var y_offset

var possible_bricks = [
preload("res://Scenes/bluebrick.tscn"),
preload("res://Scenes/yellowbrick.tscn"),
preload("res://Scenes/greenbrick.tscn"),
preload("res://Scenes/redbrick.tscn"),
preload("res://Scenes/orangebrick.tscn"),
preload("res://Scenes/purplebrick.tscn")
]

var all_bricks = []

func _ready():
	all_bricks = make_2d_array()
	spawn_bricks()
	pass # Replace with function body.
	
func grid_to_pixel (col, row):
	var new_x = x_start + x_offset * col
	var new_y = y_start + -y_offset * row
	return Vector2(new_x, new_y);

func make_2d_array():
	var array = []
	for c in width:
		array.append([])
		for r in height:
			array[c].append(null)
	return array
	
func spawn_bricks():
	for i in width:
		for j in height:
			randomize()
			#choose random num and store it
			var rand = floor(rand_range(0, possible_bricks.size()))
			#instance brick from array
			var brick = possible_bricks[rand].instance()
			if int(rand_range(1 , 5)) == 4:
				brick.health = 2
			add_child(brick)
			brick.position = grid_to_pixel(i, j)
			all_bricks[i][j] = brick
	pass