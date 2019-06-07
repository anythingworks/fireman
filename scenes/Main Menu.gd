extends Node

var timer = null
var blip_Delay = .3
var can_blip = true


func _ready():
	timer = Timer.new()
	timer.set_wait_time(blip_Delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	
	
func on_timeout_complete():
	can_blip = true

func _on_Start_pressed():
	var tree = get_tree()
	tree.change_scene("res://scenes/Stage1.tscn")

func _on_Quit_pressed():
	get_tree().quit()


func _on_Settings_pressed():
	var tree = get_tree()
	tree.change_scene("res://scenes/Settings.tscn")



func _on_Start_mouse_entered():
	if can_blip:
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://music_or_sounds/game_sounds/Game blip.wav")
		player.play()
		can_blip = false
		timer.start()

func _on_Settings_mouse_entered():
	if can_blip:
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://music_or_sounds/game_sounds/Game blip.wav")
		player.play()
		can_blip = false
		timer.start()


func _on_Quit_mouse_entered():
	if can_blip:
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://music_or_sounds/game_sounds/Game blip.wav")
		player.play()
		can_blip = false
		timer.start()
