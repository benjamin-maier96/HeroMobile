extends Area2D
class_name Projectile

var direction : Vector2
@export var data: ProjectileData

func _ready() -> void:
    $Sprite2D.texture = data.texture

func _process(delta):
    # move the projectile
    position += data.speed * direction * delta
    
    # rotate the projectile
    rotation = Vector2.RIGHT.angle_to(direction)
    
    if !get_viewport_rect().has_point(position):
        queue_free()

func _on_area_entered(area: Area2D) -> void:
    if area.has_method("take_damage"):
        area.take_damage(data.damage)

    queue_free()
