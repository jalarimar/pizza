extends Node2D

var nFriends = 0
var currentScore = 0

func _ready():
	for friend in get_tree().get_nodes_in_group("friend"):
		nFriends += 1
		friend.connect("eat", self, "add_to_score")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$RichTextLabel.text = str(currentScore) + " / " + str(nFriends)

func add_to_score(coolness):
	currentScore += coolness