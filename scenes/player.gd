extends KinematicBody2D

var velocity = Vector2()
var speed = 0
var direction = Vector2(1.0,0)

func rotation_amount(l_stick_axis):
	return 3.14 / 50 * (speed + 10)  / 88 * l_stick_axis

func stick_is_left(stick):
	return stick < -.08
func stick_is_right(stick):
	return stick > .08

func animate_left(stick):
	if stick < -.98:
		print("full left")
		$Sprite.play("turn")
	elif stick < -.66:
		print("slight left")
		$Sprite.play("small_turn")
	elif stick < -.4:
		print("little left")
		$Sprite.play("constant")
func animate_right(stick):
	if stick > .98:
		print("full right")
		$Sprite.play("turn")
	elif stick > .66:
		print("slight right")
		$Sprite.play("small_turn")
	elif stick > .4:
		print("little right")
		$Sprite.play("constant")
func animate_idle():
	$Sprite.play("constant")

func _physics_process(delta):
	rotation = direction.angle() - (3.14 / 2)
	
	
	var l_stick_axis = Input.get_joy_axis(0,JOY_AXIS_0)

	if stick_is_left(l_stick_axis):
		direction = direction.rotated(rotation_amount(l_stick_axis))
		$Sprite.flip_h = true
		animate_left(l_stick_axis)
	elif stick_is_right(l_stick_axis):
		direction = direction.rotated(rotation_amount(l_stick_axis))
		$Sprite.flip_h = false
		animate_right(l_stick_axis)
	else:
		animate_idle()



#	if Input.is_action_pressed("ui_right"):
#		direction = direction.rotated(rotation_amount(l_stick_axis))
#		$Sprite.flip_h = false
#		if l_stick_axis > .7:
#			$Sprite.play("turn")
#		elif l_stick_axis > .4:
#			pass
#		else:
#			$Sprite.play("small_turn")
#
#	elif Input.is_action_pressed("ui_left"):
#		direction = direction.rotated(rotation_amount(l_stick_axis))
#		$Sprite.flip_h = true
#		if l_stick_axis < -.7:
##			print('full left')
#			$Sprite.play("turn")
#		elif l_stick_axis < -.4 && l_stick_axis >= -.7:
##			print('slight left')
#			$Sprite.play("small_turn")
#		else:
#			print('none')
#			$Sprite.play("constant")
#
#	else:
#		$Sprite.play("constant")
#
	if Input.is_action_pressed("ui_up"):
		if speed < 80:
			speed += 1

	elif Input.is_action_pressed("ui_down"):
		if speed > 0:
			speed -= 1
			
	velocity = direction
	velocity.x = velocity.x * speed
	velocity.y = velocity.y * speed

	move_and_slide(velocity)