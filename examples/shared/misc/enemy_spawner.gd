extends Node2D

@export var spawn_infos: Array[Spawn_info] = []

@onready var player = get_tree().get_first_node_in_group("player")

@export var time = 0

func _on_timer_timeout():
    time += 1
    for spawn_info in spawn_infos:
        if time >= spawn_info.time_start and time <= spawn_info.time_end:
            if spawn_info.spawn_delay_counter < spawn_info.enemy_spawn_delay:
                spawn_info.spawn_delay_counter += 1
            else:
                spawn_info.spawn_delay_counter = 0
                var new_enemy = spawn_info.enemy
                var counter = 0
                while  counter < spawn_info.enemy_num:
                    var enemy_spawn = new_enemy.instantiate()
                    enemy_spawn.global_position = get_random_position()
                    add_child(enemy_spawn)
                    counter += 1

func get_random_position():
    var viewport_size = get_viewport_rect().size
    var spawn_radius = randf_range(1.1, 1.4)

    var half_w = viewport_size.x * spawn_radius * 0.5
    var half_h = viewport_size.y * spawn_radius * 0.5

    var side = randi() % 4
    var spawn_pos = Vector2.ZERO

    match side:
        0: # top
            spawn_pos.x = randf_range(-half_w, half_w)
            spawn_pos.y = -half_h

        1: # bottom
            spawn_pos.x = randf_range(-half_w, half_w)
            spawn_pos.y = half_h

        2: # left
            spawn_pos.x = -half_w
            spawn_pos.y = randf_range(-half_h, half_h)

        3: # right
            spawn_pos.x = half_w
            spawn_pos.y = randf_range(-half_h, half_h)

    return player.global_position + spawn_pos
