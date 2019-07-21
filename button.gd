extends Button

export(PackedScene) var level

func _pressed():
    get_tree().change_scene_to(level)