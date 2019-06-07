extends Node2D


func _ready():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://music_or_sounds/Retro Space Ambience.ogg")
	player.play()
	pass
	
#var astroid_resource = load('res://scenes/Astroid.tscn')
#var astroid = astroid_resource.instance()
#var spawn_astroid = get_node('.').add_child(astroid)
#var hi = astroid.set_pos(Vector2(1208, randi()%720))


