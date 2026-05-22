extends CharacterBody2D

class_name EnemyBase

@export var data: EnemyData

var player = null
var health: float

func _ready():
    health = data.health
    $Sprite2D.texture = data.texture

func _physics_process(delta):
    if player:
        var direction = (player.global_position - global_position).normalized()
        velocity = direction * data.speed
        move_and_slide()

func take_damage(amount: float) -> void:
    health -= amount
    print("enemy took damage: ", amount)

    if health <= 0:
        die()

func die():
    queue_free()


func _on_hurtbox_damaged(amount: float) -> void:
    take_damage(amount)
