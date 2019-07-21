extends Sprite

func _ready():
    while true:
        $Tween.interpolate_property(self, "position", position, position + Vector2.DOWN * 20, 3, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
        $Tween.start()
        yield($Tween, "tween_completed")
        $Tween.interpolate_property(self, "position", position, position + Vector2.UP * 20, 3, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
        $Tween.start()
        yield($Tween, "tween_completed")
    