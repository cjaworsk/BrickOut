extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		pause()
	pass

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	game_manager.current_scene.get_node("Timer").paused = new_pause_state
	visible = new_pause_state
	pass