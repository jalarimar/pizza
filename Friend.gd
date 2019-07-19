extends KinematicBody2D
signal pizza

var loudness = 0      # 1, 2, 3
var is_chatty = false
var hungryness = 1    # 1, 2, 3
var coolness = 0      # -5, 1, 5, 20
var is_aware = false
var direction = Vector2.UP
var speed = 100


func _ready():
    # randomly generate stats
    
    # set image depending on stats
    $Sprite.texture = load("res://person_friend.png")
    
func _process(delta):
    
    move_and_slide(direction * speed)

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
