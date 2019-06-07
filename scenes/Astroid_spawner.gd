extends Node





func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Timer_timeout():
	var astroid_resource = load('res://scenes/Astroid.tscn')
	var astroid = astroid_resource.instance()
	var spawn_astroid = get_node('.').add_child(astroid)
	astroid.set_position(Vector2(1208, randi() % 720))
	print('Timer_workin')
