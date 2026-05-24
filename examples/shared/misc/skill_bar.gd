extends CanvasLayer

@onready var hbox = $Control/HBoxContainer

@export var skill_manager: SkillManager

var skill_rect_scene = preload("res://examples/shared/misc/skill_rect.tscn")

func _ready():
    for skill in skill_manager.skills:
        var skill_rect = skill_rect_scene.instantiate()
        skill_rect.skill = skill
        hbox.add_child(skill_rect)
