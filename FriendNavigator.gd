extends Navigation2D

func _draw():
    var pizza_box = get_tree().get_nodes_in_group("pizza_box")[0]
    for friend in get_tree().get_nodes_in_group("friend"):
        var path = get_simple_path(friend.position, pizza_box.position)
        for i in range(path.size() - 1):
            draw_line(path[i], path[i+1], Color.aliceblue, 5)

func _process(delta):
    var pizza_box = get_tree().get_nodes_in_group("pizza_box")[0]
    for friend in get_tree().get_nodes_in_group("friend"):
        var path = get_simple_path(friend.position, pizza_box.position)
        if path.size() > 1:
            friend.direction = (path[1] - friend.position).normalized()
    update()