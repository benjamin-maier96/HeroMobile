class_name BasicArrowAttack
extends Skill

var player: CharacterBody2D = null

func _ready():
    super()
    player = get_tree().get_first_node_in_group("player")
    

func activate():
    var arrow = load("res://examples/shared/projectiles/arrow/arrow.tscn").instantiate()
    if player:
        arrow.global_position = player.global_position
        arrow.direction = (
            get_viewport().get_mouse_position() - player.global_position
        ).normalized()
    else:
        arrow.global_position = get_viewport().get_mouse_position()
        arrow.direction = Vector2(1, 0)
    get_tree().current_scene.add_child(arrow)
    
