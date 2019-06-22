extends Label

func _ready():
	self.text = str(game_manager.score)
	pass
