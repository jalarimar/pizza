extends KinematicBody2D
signal pizza

var loudness = 0      # 1, 2, 3
var is_chatty = false
var hungryness = 1    # 1, 2, 3
var coolness = 0      # -5, 1, 5, 20
var is_aware = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# randomly generate stats
	
	# set image depending on stats
	$Sprite.texture = load("friend.png")
	


func on_reach_pizza_box():
	if not is_aware:
		is_aware = true
		emit_signal("pizza", position)
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
