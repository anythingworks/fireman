extends Node2D


func _ready():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://music_or_sounds/Retro Space Ambience.ogg")
	player.play()
	pass

