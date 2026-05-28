extends Skill

@onready var ARROW_SCENE: PackedScene = preload("res://examples/shared/projectiles/ice_arrow/ice_arrow.tscn")

var arrow_count := 5
var spread_angle := 20.0 # degrees

var arrow_position: Vector2
var base_direction: Vector2

func activate():
    if player:
        arrow_position = player.global_position
        base_direction = (
            get_viewport().get_mouse_position() - player.global_position
        ).normalized()
    else:
        arrow_position = get_viewport().get_mouse_position()
        base_direction = Vector2.RIGHT

    for i in range(arrow_count):
        var arrow = ARROW_SCENE.instantiate()
        arrow.caster = player

        # Center the spread
        var t = 0.0
        if arrow_count > 1:
            t = float(i) / float(arrow_count - 1)

        # Convert spread to radians
        var angle_offset = deg_to_rad(
            lerp(-spread_angle / 2.0, spread_angle / 2.0, t)
        )

        arrow.global_position = arrow_position
        arrow.direction = base_direction.rotated(angle_offset)

        get_tree().current_scene.add_child(arrow)
    
