# Skill bar and enemy spawner
## Topics covered
- TextureRect and HBoxes
- Skill bar
- Enemy spawner
## TextureRect and HBoxes
TextureRect is a UI node that allows to display a texture. A problem can arise when trying to put a texture rect inside a HBoxContainer. Typically the HBox will ignore the size attribute of the texture rect, instead the texture rect has an attribute "Expand Mode", which will decide how the minimu size is calculated. Setting this to keep size, will use the texture size as the minimum size. __Note:__ For a HBox only the horizontal axis, the x-axis, will use the minimum required size. The y-size of the texture rect is given by the HBox size. Now the "Stretch Mode" of the texture rect, decides how to y-axis of the texture is stretchd. With "Keep" the texture keeps it original size, even if the HBox y-size is larger.
## Skill bar
The skill bar is simply a HBox which stores the SkillRect nodes. But behind it is a SkillManager which stores the current Skills. Each skill is responsible for its own cooldown. The SkillRect is then only displaying the cooldown.
## Enemy spawner
The enemy spawner is a node that is responsible for instantiating enemy nodes and placing them on the level. We use a SpawnInfo to specify what kind of enemies and how many to spawn.