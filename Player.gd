extends KinematicBody2D
signal speak_pizza

var speak_range = 1
var speed = 200
var is_mouse_hover = false

func _physics_process(delta):
    var horizontal = Input.get_action_strength("right") - Input.get_action_strength("left")
    var vertical = Input.get_action_strength("down") - Input.get_action_strength("up")
    var movement = Vector2(horizontal, vertical)
    if movement.length() > 1: # support non-normalized movement vector for console controls
        movement = movement.normalized()
    movement = movement * speed
    move_and_slide(movement)

func _input(event):
	if event.is_action_pressed("space"):
		emit_signal("speak_pizza", position, speak_range)

