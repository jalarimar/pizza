extends Navigation2D

func _draw():
    for friend in get_tree().get_nodes_in_group("friend"):
        if friend.is_aware and friend.target:
            var path = get_simple_path(to_local(friend.global_position), to_local(friend.target.global_position))
            for i in range(path.size() - 1):
                draw_line(path[i], path[i+1], Color.aliceblue, 5)

func _process(delta):
    var pizza_box = get_tree().get_nodes_in_group("pizza_box")[0]
    for friend in get_tree().get_nodes_in_group("friend"):
        if not friend.is_aware or friend.full:
            continue
        
        var target
        # if we already have a target, use that.
        if friend.target != null:
            target = friend.target
        
        # otherwise, try to claim a pizza slice as a target
        if target == null: 
            for pizza in get_tree().get_nodes_in_group("pizza_slices"):
                if not pizza.is_claimed:
                    pizza.is_claimed = true
                    friend.target = pizza
                    target = pizza
                    break

        
        # otherwise the pizza box is our target
        if target == null:
            friend.target = pizza_box
            target = pizza_box
 
        var path = get_simple_path(to_local(friend.global_position), to_local(target.global_position))
        if path.size() > 1:
            friend.direction = (to_global(path[1]) - friend.global_position).normalized()
    update()