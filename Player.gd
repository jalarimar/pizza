extends KinematicBody2D
signal pizza

var speak_range = 5
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
