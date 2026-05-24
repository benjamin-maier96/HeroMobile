class_name SkillManager
extends Node2D

@export var skill_scenes: Array[PackedScene]
 
var skills: Array[Skill]

func _ready():
    for skill_scene in skill_scenes:
        var skill = skill_scene.instantiate()
        skills.append(skill)
        add_child(skill)
