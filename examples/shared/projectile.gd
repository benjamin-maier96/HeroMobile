extends Area2D
class_name Projectile

var speed : int = 300
var direction : Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    # move the projectile
    position += speed * direction * delta
    
    # rotate the projectile
    rotation = Vector2.RIGHT.angle_to(direction)
    
    if !get_viewport_rect().has_point(position):
        queue_free()
