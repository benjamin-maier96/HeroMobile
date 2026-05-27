extends Node2D

@onready var glow_line: Line2D = $GlowLine
@onready var core_line: Line2D = $CoreLine


func _ready():
    var width_curve = create_lightning_curve()

    # OUTER GLOW
    glow_line.width = 10.0
    glow_line.default_color = Color("#5F8CFF88")
    glow_line.antialiased = true
    glow_line.width_curve = width_curve

    # INNER CORE
    core_line.width = 3.0
    core_line.default_color = Color("#F4F8FF")
    core_line.antialiased = true
    core_line.width_curve = width_curve

    visible = false


func create_lightning_curve() -> Curve:
    var curve := Curve.new()

    # start thin
    curve.add_point(Vector2(0.0, 0.5))

    # thick middle
    curve.add_point(Vector2(0.5, 1.0))

    # thin end
    curve.add_point(Vector2(1.0, 0.5))

    return curve


func setup(start_pos: Vector2, end_pos: Vector2):
    visible = true
    modulate.a = 1.0

    for i in range(1):
        generate_lightning(start_pos, end_pos)
        await get_tree().process_frame

    var tween = create_tween()
    tween.tween_property(self, "modulate:a", 0.0, 0.08)

    await tween.finished

    visible = false
    modulate.a = 1.0


func generate_lightning(start_pos: Vector2, end_pos: Vector2):
    glow_line.clear_points()
    core_line.clear_points()

    var segments := 10

    var direction = (end_pos - start_pos).normalized()
    var normal = direction.orthogonal()

    for i in range(segments + 1):
        var t = float(i) / segments
        var pos = start_pos.lerp(end_pos, t)

        if i != 0 and i != segments:
            var offset_strength = 14.0 * (1.0 - abs(t - 0.5) * 2.0)

            pos += normal * randf_range(
                -offset_strength,
                offset_strength
            )

        glow_line.add_point(pos)
        core_line.add_point(pos)
