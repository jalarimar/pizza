extends KinematicBody2D
signal speak_pizza
signal eat

# stats
export var speak_range = 1      # 1, 2, 3
var is_chatty = false
var hungryness = 1    # 1, 2, 3
export var coolness = 1   # todo figure out scoring when adding cooler people   # -5, 1, 5, 20
var is_aware = false
var direction = Vector2.UP
var speed = 200

# variables
var full = false
var target = null

func _ready():
    # randomly generate stats
    # set image depending on stats
    if speak_range == 3:
        $Sprite.texture = load("res://person_friend_mega_loud.png")
    elif speak_range == 2:
        $Sprite.texture = load("res://person_friend_loud.png")
    else:
        $Sprite.texture = load("res://person_friend.png")
    
    if coolness == 0:
        $Sprite.modulate = Color("#f690ff")
    
func _process(delta):
    if is_aware and not full:
        move_and_slide(direction * speed)
    if not is_aware and get_parent() is PathFollow2D:
        get_parent().set_offset(get_parent().get_offset() + 500 * delta)

func on_reach_pizza():
    if not is_aware:
        is_aware = true
        emit_signal("speak_pizza", position, speak_range)
    
    if target and target.is_in_group("pizza_slices"):
        target.be_eaten(global_position)
        yield(target, "eaten")
        full = true
        if coolness == 1:
            $Sprite.modulate = Color("#00ccff")
        else:
            $Sprite.modulate = Color("#ee55ff")
        target = null
        emit_signal("eat", coolness)

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
        emit_signal("speak_pizza", global_position, speak_range)
