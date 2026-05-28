class_name VFXResource
extends EffectResource

@export var vfx_name: String

func execute(ctx: TriggerContext) -> void:
    VFX.spawn(
        "freeze_hit",
        ctx.position,
        (ctx.position - ctx.caster.global_position).normalized()
    )
