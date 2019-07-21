extends Button

export(String) var level

func _pressed():
    get_tree().change_scene(level)