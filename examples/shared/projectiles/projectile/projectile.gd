extends Area2D
class_name Projectile

var direction : Vector2
@export var data: ProjectileData
var caster: Node2D

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
    var ctx: TriggerContext = TriggerContext.new()
    
    ctx.target = area.get_parent()
    ctx.position = global_position
    ctx.caster = caster
    
    trigger(GameTypes.TriggerType.ON_HIT, ctx)

    queue_free()


func trigger(trigger_type: GameTypes.TriggerType, ctx: TriggerContext) -> void:
    for triggered_effect in data.triggered_effects:
        if triggered_effect.trigger == trigger_type:
            triggered_effect.effect.execute(ctx)
