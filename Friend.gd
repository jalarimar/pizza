extends KinematicBody2D
signal speak_pizza

var speak_range = 3      # 1, 2, 3
var is_chatty = false
var hungryness = 1    # 1, 2, 3
var coolness = 0      # -5, 1, 5, 20
var is_aware = false
var direction = Vector2.UP
var speed = 200

func _ready():
	# randomly generate stats
	
	# set image depending on stats
	$Sprite.texture = load("res://person_friend.png")
	
func _process(delta):
	if is_aware:
		move_and_slide(direction * speed)
	else:
		pass
		# use normal path
		

func on_reach_pizza_box():
	if not is_aware:
		is_aware = true
		emit_signal("speak_pizza", position, speak_range)
	for pizza in get_parent().get_node("PizzaBox").get_children():
		if not pizza.is_claimed:
			pizza.is_claimed = true
			# move pizza
			pizza.queue_free()
			break


func make_comments():
	if is_aware:
		# make pizza comment
		pass
	else:
		# make ordinary comment
		pass


func _on_Friend_mouse_entered():
	# show friend list
	pass


# when the friend hears pizza
func hear_pizza():
	if not is_aware:
		is_aware = true
		emit_signal("speak_pizza", position, speak_range)
