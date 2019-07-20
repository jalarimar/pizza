extends Area2D

func on_body_enter(body):
    if body.is_in_group("people") and body.has_method("on_reach_pizza"):
        body.on_reach_pizza()