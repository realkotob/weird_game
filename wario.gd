extends Sprite

func _ready():
	pass
func _process(delta):
	
	var move = Vector2(0,0)
	
	if Input.is_action_pressed("down"):
		move.y = 1
	if Input.is_action_pressed("up"):
		move.y = -1
	
	move_and_slide(move 