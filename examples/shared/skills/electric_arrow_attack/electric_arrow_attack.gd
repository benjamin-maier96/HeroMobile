extends Skill

func activate():
    var arrow = load("res://examples/shared/projectiles/electric_arrow/electric_arrow.tscn").instantiate()
    if player:
        arrow.global_position = player.global_position
        arrow.direction = (
            get_viewport().get_mouse_position() - player.global_position
        ).normalized()
    else:
        arrow.global_position = get_viewport().get_mouse_position()
        arrow.direction = Vector2(1, 0)
    get_tree().current_scene.add_child(arrow)
