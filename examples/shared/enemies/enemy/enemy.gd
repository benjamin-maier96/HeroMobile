extends CharacterBody2D

class_name EnemyBase

@export var data: EnemyData

var player = null
var health: float
@onready var anim = $AnimationPlayer

func _ready():
    health = data.health
    $Sprite2D.texture = data.texture
    player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
    if player:
        var direction = (player.global_position - global_position).normalized()
        velocity = direction * data.speed
        move_and_slide()

func take_damage(amount: float) -> void:
    health -= amount
    anim.play("hit_animation")
    #VFX.spawn("freeze_hit", global_position, (global_position - player.global_position).normalized())
    
    $DamageNumberSpawner.spawn_label(amount)

    if health <= 0:
        die()


func _on_hurtbox_damaged(amount: float) -> void:
    take_damage(amount)


func die():

    velocity = Vector2.ZERO
    set_physics_process(false)

    collision_layer = 0
    collision_mask = 0

    play_death_animation()


func play_death_animation():
    var sprite = $Sprite2D

    var tween = create_tween()

    # Slight pop
    tween.tween_property(
        sprite,
        "scale",
        Vector2(1.3, 1.3),
        0.1
    )

    # Shrink away
    tween.tween_property(
        sprite,
        "scale",
        Vector2.ZERO,
        0.25
    )

    # Fade simultaneously during shrink
    tween.parallel().tween_property(
        sprite,
        "modulate:a",
        0.0,
        0.25
    )

    await tween.finished

    queue_free()
