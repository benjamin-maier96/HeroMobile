class_name Skill
extends Node

var cooldown_timer := 1.0

func _process(delta):
    cooldown_timer -= delta

    if cooldown_timer <= 0:
        activate()
        cooldown_timer = 1.0

func activate():
    pass
