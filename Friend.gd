extends KinematicBody2D

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
	


func eat_pizza():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Friend_mouse_entered():
	# show friend list
	pass
