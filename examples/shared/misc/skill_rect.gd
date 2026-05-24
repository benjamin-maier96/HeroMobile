extends TextureRect

@onready var cooldown = $Cooldown
@onready var time = $Time

var skill: Skill

func _ready():
    texture = skill.data.texture
    cooldown.max_value = skill.data.cooldown
    set_process(true)


func _process(_delta):
    time.text = "%3.1f" % skill.cooldown_timer
    cooldown.value = skill.cooldown_timer
