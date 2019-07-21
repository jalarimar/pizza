extends Area2D

var speak_range = 0
var circle_radius = 0

const modifier = 1
const scale_base = Vector2(0.2, 0.2)
const radius_base = 100

# Called when the node enters the scene tree for the first time.
func _ready():
    $Tween.interpolate_property($Sprite, "scale", Vector2(0.05, 0.05), speak_range * scale_base * modifier, speak_range * modifier * 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    $Tween.interpolate_property(self, "circle_radius", 10, speak_range * radius_base * modifier, speak_range * modifier * 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    $Tween.start()
    yield($Tween, "tween_completed")
    
    queue_free()

func _physics_process(delta):
    $CollisionShape2D.shape.radius = circle_radius
    for body in get_overlapping_bodies():
        if body.has_method("hear_pizza"):
            body.hear_pizza()
            
#func _process(delta):
#    update()
#
#func _draw():
#    draw_circle(Vector2(), $CollisionShape2D.shape.radius, Color.black)