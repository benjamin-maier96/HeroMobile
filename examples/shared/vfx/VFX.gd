extends Node

var effects = {
    "freeze": preload("res://examples/shared/vfx/freeze.tscn"),
    "freeze_hit": preload("res://examples/shared/vfx/freeze_hit.tscn"),
    "lightning_bolt": preload("res://examples/shared/vfx/lightning_bolt.tscn"),
}

func spawn(
    effect_name: String,
    position: Vector2,
    dir: Vector2 = Vector2.ZERO
) -> void:
    if not effects.has(effect_name):
        push_warning("VFX not found: " + effect_name)
        return

    var effect = effects[effect_name].instantiate()

    effect.global_position = position

    if dir != Vector2.ZERO:
        effect.global_rotation = dir.angle()

    get_tree().current_scene.add_child(effect)


func spawn_between(
    effect_name: String,
    start_pos: Vector2,
    end_pos: Vector2
) -> void:
    if not effects.has(effect_name):
        push_warning("VFX not found: " + effect_name)
        return

    var effect = effects[effect_name].instantiate()

    get_tree().current_scene.add_child(effect)

    if effect.has_method("setup"):
        effect.setup(start_pos, end_pos)
