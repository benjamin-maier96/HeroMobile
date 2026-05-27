extends Resource
class_name ChainLightningEffect

@export var max_jumps := 4
@export var chain_range := 200.0
@export var damage := 1

func apply(first_hurtbox):
    first_hurtbox.take_damage(damage)
    var enemy = first_hurtbox.get_parent()
    _chain(enemy)

func _chain(current_enemy):
    var hit_enemies = [current_enemy]

    for i in range(max_jumps):
        var next = find_nearest_enemy(
            current_enemy.global_position,
            hit_enemies
        )

        if next == null:
            break

        next.take_damage(damage)

        VFX.spawn_between("lightning_bolt", current_enemy.global_position, next.global_position)

        hit_enemies.append(next)
        current_enemy = next

        await Engine.get_main_loop().create_timer(0.03).timeout
        

func find_nearest_enemy(
    from_pos: Vector2,
    excluded: Array
):
    var enemies = Engine.get_main_loop() \
        .current_scene \
        .get_tree() \
        .get_nodes_in_group("enemies")

    var nearest = null
    var nearest_dist = chain_range

    for enemy in enemies:
        if enemy in excluded:
            continue

        var dist = from_pos.distance_to(enemy.global_position)

        if dist < nearest_dist:
            nearest_dist = dist
            nearest = enemy

    return nearest
