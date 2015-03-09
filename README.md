# Flambe-AnimatedSprite
AnimatedSprite is a simple tool for making animated graphics using single separate images. It is not as robust as other animation tools but it is perfect for small scale and simple sprite animations.

This tool is inspired by the animation toolkit of Flixel (http://haxeflixel.com/documentation/flxsprite/#animation).

# Working Example
Check it out in action here: http://accidentalrebel.github.io/Flambe-AnimatedSprite/

# Createing an AnimatedSprite object

```
_animatedSprite = new AnimatedSprite(assetPack, textureArray); 
```
* **assetPack** - The assetpack to get the textures from
* **textureArray** - An array containing strings which points to the images to be used by this animated sprite

## Example
```
_animatedSprite = new AnimatedSprite(pack, 
	[ "pop/idle_awake/1"
	, "pop/idle_awake/2"
	, "pop/idle_awake/3"
	, "pop/idle_awake/4"
	, "pop/idle_sleeping/1"
	, "pop/idle_sleeping/2"
	, "pop/idle_sleeping/3"
	, "pop/idle_sleeping/4"
	]
);
```
# Adding Animations
Adds animations to the animatedSprite.

```
_animatedSprite.addAnimation(animationName, frameSequence, animationSpeed);
```
* **animationName** - The name of the animation. Avoid duplicates!
* **frameSequence** - An array containing the sequence of the animation in relation to the textureArray during initialization (Check example)
* **animationSpeed** - The delay before changing to the next frame of the animation

## Example

```
_animatedSprite.addAnimation("idle_awake", [0, 1, 2, 3, 2, 1, 0, 0], 0.65);
_animatedSprite.addAnimation("idle_sleeping", [4, 5, 6, 7, 6, 5, 4, 4], 0.65);
```
**Note:** The frameSequence relates to the index of textureArray. e.g. 0 will use "pop/idle_awake/1, 1 will use "pop/idle_awake/2", 2 will use"pop/idle_awake/3" and so on

# Looping Animations
Immediately plays the specified animation. Loops back to the beginning frame when it reaches the last frame.

```
_animatedSprite.loopAnimation(animationToLoop);
```
* **animationToLoop** - The name of the animation you want to loop

## Example
```
_animatedSprite.loopAnimation("idle_awake");
```

# Playing Animations
Immediately plays the specified animation. Goes back to the previous looping animation when it reaches the last frame.

```
_animatedSprite.playAnimation(animationToPlay);
```
	
* **animationToPlay** - The name of the animation you want to play	

## Example
```
_animatedSprite.playAnimation(animationToPlay);
```
The “forward” loop animation is played as soon as the “backward” animation finishes playing.

**Note:** You should have a loop animation looping first before calling a playAnimation. Otherwise, an error will be thrown.

#Copyright
Images of the "Pop the Bear" character found in this project is copyrighted to AccidentalRebel Games.
