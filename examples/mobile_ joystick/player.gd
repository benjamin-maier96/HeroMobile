extends CharacterBody2D

@export var speed : float = 100

@export var joystick : VirtualJoystick

var move_vector := Vector2.ZERO

func _process(delta: float) -> void:
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * speed
	move_and_slide()
