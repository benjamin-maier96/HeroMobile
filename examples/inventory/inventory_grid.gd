extends PanelContainer

@export var items: Array[ItemData]
@export var max_items: int
@onready var grid: GridContainer = $VBoxContainer/GridContainer
@onready var item_slot_scene: PackedScene = preload("res://examples/inventory/item_slot.tscn")

func _ready() -> void:
    for item in items:
        var item_slot: ItemSlot = item_slot_scene.instantiate()
        item_slot.item_data = item
        grid.add_child(item_slot)
    # fill the empty slots
    for i in range(max_items - items.size()):
        var item_slot: ItemSlot = item_slot_scene.instantiate()
        grid.add_child(item_slot)
