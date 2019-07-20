extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var people = get_tree().get_nodes_in_group("people")
	for person in people:
		person.connect("speak_pizza", self, "create_notification")


func create_notification(position, speak_range):
	var notification = preload("res://Notification.tscn").instance()
	notification.position = position
	notification.speak_range = speak_range
	get_parent().add_child(notification) # add notification on same level as notification controller