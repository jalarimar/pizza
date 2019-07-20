extends KinematicBody2D
signal speak_pizza
signal eat

var speak_range = 1      # 1, 2, 3
var is_chatty = false
var hungryness = 1    # 1, 2, 3
var coolness = 1      # -5, 1, 5, 20
var is_aware = false
var direction = Vector2.UP
var speed = 200

var target = null

enum State {
    IDLE,
    HUNTING,
    FULL,
}

var state = State.IDLE

func _ready():
    # randomly generate stats
    
    # set image depending on stats
    $Sprite.texture = load("res://person_friend.png")
    
func _physics_process(delta):
    if is_aware:
        move_and_slide(direction * speed)
        
func on_reach_pizza():
    if not is_aware:
        is_aware = true
        emit_signal("speak_pizza", position, speak_range)
    
    if target.is_in_group("pizza_slices"):
        target.be_eaten(position)
        yield(target, "eaten")
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
