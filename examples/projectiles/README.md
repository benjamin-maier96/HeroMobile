# Projectiles and skills
## Topics covered
- Creating a projectile
- Creating a skill

## Creating a projectile
We distinguish between projectiles and skills to have a clearer separation of concerns. A projectile holds the sprite and
is then used for calculating hit boxes and dealing damage, where a skill is used for creating projectiles. <br>
A projectile is based on a [projectile scene](/examples/shared/projectile.tscn) and [projectile script](/examples/shared/projectile.gd). To add a new projectile we create an inherited scene from the projectile scene. There we can then add the sprite. Since projectiles are rotated to the direction they are flying, it is important to rotate the base sprite to align with the x-axis. See [the arrow projectile](/examples/shared/arrow.tscn) as an example.
## Creating a skill
As mentioned above a skill can be used to create a projectile. In our game skills are activated automatically. In [the base class](/examples/shared/skill.gd) we process to cooldown and call the activate method. A real skill is then inheriting the scene and [fills in](/examples/shared/basic_arrow_attack.gd) the activate method.
## ToDos
- add an enemy with a hurtbox
- add a hitbox to the arrow
- do some basic damage 