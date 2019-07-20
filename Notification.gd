extends Area2D

var speak_range = 0
var circle_radius = 0
# Called when the node enters the scene tree for the first time.
func _ready():
    $Tween.interpolate_property($Sprite, "scale", Vector2(0.1, 0.1), Vector2(speak_range, speak_range), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    $Tween.interpolate_property(self, "circle_radius", 0, speak_range * 100, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    $Tween.start()
    yield($Tween, "tween_completed")
    queue_free()

func _physics_process(delta):
    $CollisionShape2D.shape.radius = circle_radius
    for body in get_overlapping_bodies():
        if body.has_method("hear_pizza"):
            body.hear_pizza()