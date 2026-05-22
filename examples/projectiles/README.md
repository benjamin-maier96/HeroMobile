# Projectiles and skills
## Topics covered
- Creating a projectile
- Creating a skill

## Creating a projectile
We distinguish between projectiles and skills to have a clearer separation of concerns. A projectile holds the sprite and
is then used for calculating hit boxes and dealing damage, where a skill is used for creating projectiles. <br>
A projectile is based on a [projectile scene](/examples/shared/projectiles/projectile/projectile.tscn) and [projectile script](/examples/shared/projectiles/projectile/projectile.gd). To add a new projectile we create an inherited scene from the projectile scene. There we can then add the sprite. Since projectiles are rotated to the direction they are flying, it is important to rotate the base sprite to align with the x-axis. See [the arrow projectile](/examples/shared/projectiles/arrow/arrow.tscn) as an example.
## Creating a skill
As mentioned above a skill can be used to create a projectile. In our game skills are activated automatically. In [the base class](/examples/shared/skills/skill/skill.gd) we process to cooldown and call the activate method. A real skill is then inheriting the scene and [fills in](/examples/shared/skills/basic_arrow_attack/basic_arrow_attack.gd) the activate method.
## Hit boxes and hurt boxes
Hit boxes are used to detect if the object is hitting something, e.g. the projectile the enemy. Hurt boxes are used to detect hits from hit boxes. <br>
For the enemy class we emit a signal from the [hurt box](/examples/shared/enemies/enemy/hurtbox.gd). To only collide with the correct kind of objects, we can set layers and masks. Layers are the groups the area is part of, e.g. projectile and masks is what groups it can collide with, e.g. enemies.
## Resources
All kind of data are best stored in godot resources. For each resource type, e.g. projectile, we need to create [a script](/examples/shared/resources/projectile_data.gd) that describes the resource. Then we can create resources based on the class_name. We also store the texture in the resource and then assign it with the _ready() function.