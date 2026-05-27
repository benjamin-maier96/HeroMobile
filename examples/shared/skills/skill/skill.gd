class_name Skill
extends Node

@export var data: SkillData
var player: CharacterBody2D = null
var cooldown_timer: float

func _ready() -> void:
    cooldown_timer = data.cooldown
    player = get_tree().get_first_node_in_group("player")

func _process(delta):
    cooldown_timer -= delta

    if cooldown_timer <= 0:
        activate()
        cooldown_timer = data.cooldown

func activate():
    pass
