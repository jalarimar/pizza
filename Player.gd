extends KinematicBody2D
signal pizza

var speak_range = 5
var speed = 200
var is_mouse_hover = false
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	var movement = Vector2()
	if event.is_action_pressed("space"):
		emit_signal("pizza", position)                                                                                                                                   
	if event.is_action_pressed("up"):
		movement += Vector2.UP
	if event.is_action_pressed("down"):
		movement += Vector2.DOWN
	if event.is_action_pressed("left"):
		movement += Vector2.LEFT
	if event.is_action_pressed("right"):
		movement += Vector2.RIGHT
	
	velocity = movement.normalized() * speed

func _physics_process(delta):
	velocity = move_and_slide(velocity)


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
