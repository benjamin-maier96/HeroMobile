class_name ItemSlot
extends PanelContainer

@onready var icon: TextureRect = $MarginContainer/Icon

@export var item_data: ItemData
var _default_style: StyleBoxFlat


func _ready() -> void:
    if item_data:
        icon.texture = item_data.texture
    _default_style = get_theme_stylebox("panel").duplicate()

func refresh() -> void:
    if item_data == null:
        icon.texture = null
        return
    
    icon.texture = item_data.texture
