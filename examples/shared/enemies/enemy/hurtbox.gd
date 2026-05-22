extends Area2D

signal damaged(amount: float)

func take_damage(amount: float) -> void:
    damaged.emit(amount)
