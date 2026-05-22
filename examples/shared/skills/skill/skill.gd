class_name Skill
extends Node

@export var data: SkillData
var cooldown_timer: float

func _ready() -> void:
    cooldown_timer = data.cooldown

func _process(delta):
    cooldown_timer -= delta

    if cooldown_timer <= 0:
        activate()
        cooldown_timer = data.cooldown

func activate():
    pass
