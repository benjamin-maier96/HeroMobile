# Basic Joystic Movement
## Topics covered
- Creating a background
- Adding a joystick
- Adding a character
- Make the character move

## Preparations


## Creating a background
The background is a Sprite2D node. Since we do not want to create a sprite for each resolution, we use a small sprite and repeat it.
Therefore under __Region->Rect__ we set the size of the background.<br>
Next we need to tell Godot to repeat the sprite, his can be set under __CanvasItem->Texture->Repeat__.
## Adding a joystick
We do not have to create a joystick from hand, instead we can use the AssetLib to download a joystick. For this example we are using
[this asset](https://godotengine.org/asset-library/asset/1787). The project is then added under [addons](/addons/). Inside the project is also a [test scene](/addons/virtual_joystick/test/test.tscn).<br>
To add the joystick to our game we have to add the [joystick scene](/addons/virtual_joystick/virtual_joystick_scene.tscn).
## Adding a character
A character is based on a CharacterBody2D node and an AnimatedSprite2D node. See more under "Animate the character"
## Make the character move
The joystick sets actions for __ui_up,ui_down,etc__. These actions can then be constructed to a vector and multiplied
with our speed. Since we use the move_and_slide() function, we do not need to use delta here.
```py
func _process(delta: float) -> void:
    velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * speed
    move_and_slide()
```
## Animate the character
We use a sprite sheet as the basis for our character textures. In the AnimatedSprite2D node we create a new __SpriteFrames__, which opens the Animation window on the bottom. Here we can create our animation. To select the sprites from our spritesheet we click on __Add Frames from Sprite Sheet__. Here we can select our number of rows and coloumns. Godot will then slice the sprite sheet for us. From there we can select the individual sprites for our animation.
In this example we have to kind of animations __idle__ and __walk__.
