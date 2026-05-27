class_name VFXEffect
extends Node2D

@onready var anim = $AnimatedSprite2D

func _ready() -> void:
    anim.play()


func _on_animated_sprite_2d_animation_finished() -> void:
    queue_free()
