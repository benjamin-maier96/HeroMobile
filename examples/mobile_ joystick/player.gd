extends CharacterBody2D

@export var speed : float = 100

@onready var anim = $AnimatedSprite2D

func _process(delta: float) -> void:
    velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * speed
    move_and_slide()
    handle_animation()

func handle_animation():
    var is_moving = velocity.length() > 0.1

    var anim_prefix = "walk_" if is_moving else "idle_"

    var dir = get_mouse_direction()

    anim.play(anim_prefix + dir)

func get_mouse_direction():
    var dir = get_global_mouse_position() - global_position

    if abs(dir.x) > abs(dir.y):
        return "right" if dir.x > 0 else "left"
    else:
        return "down" if dir.y > 0 else "up"
