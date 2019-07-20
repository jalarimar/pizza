extends Node2D
signal eaten

var is_claimed = false

func be_eaten(pos):
    $Tween.interpolate_property(self, "global_position", global_position, pos, 1, Tween.TRANS_CUBIC, Tween.EASE_IN)
    $Tween.interpolate_property(self, "scale", scale, scale * 0.1, 1, Tween.TRANS_CUBIC, Tween.EASE_IN)
    $Tween.start()
    yield($Tween, "tween_completed")
    emit_signal("eaten")
    queue_free()