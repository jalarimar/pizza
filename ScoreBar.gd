extends Node2D

export(String) var next_level

var nFriends = 0
var currentScore = 0

onready var bar_start = $GreenBarStart.position
onready var bar_end = $GreenBarEnd.position


func _ready():
    for friend in get_tree().get_nodes_in_group("friend"):
        nFriends += friend.coolness
        friend.connect("eat", self, "add_to_score")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    print(currentScore / nFriends)
    $GreenBarTip.position = bar_start + (bar_end - bar_start) * (float(currentScore) / float(nFriends))
    $RichTextLabel.text = str(currentScore) + " / " + str(nFriends)

func add_to_score(coolness):
    currentScore += coolness
    if currentScore >= nFriends:
        get_tree().change_scene(next_level)