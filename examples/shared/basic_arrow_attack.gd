class_name BasicArrowAttack
extends Skill

func activate():
    var arrow = load("res://examples/shared/arrow.tscn").instantiate()
    get_tree().current_scene.add_child(arrow)
    arrow.global_position = get_viewport().get_mouse_position()
    arrow.direction = Vector2(1, 0)
