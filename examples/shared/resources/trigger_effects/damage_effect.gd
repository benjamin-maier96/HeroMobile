class_name DamageEffect
extends EffectResource

@export var damage: float = 2.0

func execute(ctx: TriggerContext) -> void:
    if ctx.target:
        ctx.target.take_damage(damage)
