extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
    var people = get_tree().get_nodes_in_group("people")
    for person in people:
        person.connect("speak_pizza", self, "create_notification")
        person.connect("chat", self, "create_speech_only")


func create_notification(position, speak_range, speech_type):
    var speech = preload("res://Speech.tscn").instance()
    speech.global_position = position
    speech.type = speech_type
    add_child(speech)
    
    var notification = preload("res://Notification.tscn").instance()
    notification.global_position = position
    notification.speak_range = speak_range
    add_child(notification) # add notification on same level as notification controller
    
func create_speech_only(position, speech_type):
    var speech = preload("res://Speech.tscn").instance()
    speech.global_position = position
    speech.type = speech_type
    add_child(speech)