extends KinematicBody2D

var move = Vector2()
const speed = 60

func _ready():
	pass
func _process(delta):
	
	move.x = 0
	move.y = 0
	$AnimationPlayer.set_speed_scale(1)

	check_key_input()
	
	idle_animation()
	
	walking_animation()
		
	move_and_slide(move)
#says how the character shall move
func move_on_y(button,orientation):
	if Input.is_action_pressed(button):
		move.y = speed * orientation
			
		if Input.is_action_pressed("run"):
			move.y = speed * 2 * orientation
			$AnimationPlayer.set_speed_scale(2)
			
func move_on_x(button,orientation):
	if Input.is_action_pressed(button):
		move.x = speed * orientation
			
		if Input.is_action_pressed("run"):
			move.x = speed * 2 * orientation
#uses the functions above	
func check_key_input():
	move_on_y("down",1)
	move_on_y("up",-1)
	move_on_x("left",-1)
	move_on_x("right",1)
#says which animation shall be used	
func walking_animation():
	if Input.is_action_pressed("left") and Input.is_action_pressed("up"):
		$wario.flip_h = true
		$AnimationPlayer.play("up_right")
	elif Input.is_action_pressed("left") and Input.is_action_pressed("down"):
		$wario.flip_h = false
		$AnimationPlayer.play("down_left")
	elif Input.is_action_pressed("right") and Input.is_action_pressed("up"):
		$wario.flip_h = false
		$AnimationPlayer.play("up_right")
	elif Input.is_action_pressed("left"):
		$wario.flip_h = true
		$AnimationPlayer.play("right")
	elif Input.is_action_pressed("up"):
		$AnimationPlayer.play("up")
	elif Input.is_action_pressed("right") and Input.is_action_pressed("down"):
		$wario.flip_h = true
		$AnimationPlayer.play("down_left")
	elif Input.is_action_pressed("right"):
		$wario.flip_h = false
		$AnimationPlayer.play("right")
	elif Input.is_action_pressed("down"):
		$AnimationPlayer.play("down")
	if Input.is_action_pressed("run"):
		$AnimationPlayer.set_speed_scale(2)
		
#says which idle animation shall be used	
func idle_animation():
	if Input.is_action_just_released("down"):
		$AnimationPlayer.stop()
		$wario.set_frame(0)
		
	if Input.is_action_just_released("up"):
		$AnimationPlayer.stop()
		$wario.set_frame(3)
		
	if Input.is_action_just_released("left"):
		$AnimationPlayer.stop()
		$wario.flip_h = true
		$wario.set_frame(6)
	
	if Input.is_action_just_released("right"):
		$AnimationPlayer.stop()
		$wario.flip_h = false
		$wario.set_frame(6)
		
	if Input.is_action_just_released("right") and Input.is_action_just_released("up"):
		$AnimationPlayer.stop()
		$wario.set_frame(9)
		
	if Input.is_action_just_released("left") and Input.is_action_just_released("up"):
		$AnimationPlayer.stop()
		$wario.flip_h = true
		$wario.set_frame(9)
		
	if Input.is_action_just_released("right") and Input.is_action_just_released("down"):
		$AnimationPlayer.stop()
		$wario.flip_h = true
		$wario.set_frame(12)
		
	if Input.is_action_just_released("left") and Input.is_action_just_released("down"):
		$AnimationPlayer.stop()
		$wario.flip_h = false
		$wario.set_frame(12)