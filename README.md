# Flambe-AnimatedSprite
AnimatedSprite is a simple tool for making animated graphics using single separate images. It is not as robust as other animation tools but it is perfect for small scale and simple sprite animations.

This tool is inspired by the animation toolkit of Flixel (http://haxeflixel.com/documentation/flxsprite/#animation).

# Working Example
Check it out in action here: http://accidentalrebel.github.io/Flambe-AnimatedSprite/

#How to Use

Initialize the animated sprite object by passing the asset pack to use as well as an array of strings which points to the images you want to use.

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

Then you need to create the actual animations like so:

		_animatedSprite.addAnimation("idle_awake", [0, 1, 2, 3, 2, 1, 0, 0], 0.65);
		_animatedSprite.addAnimation("idle_sleeping", [4, 5, 6, 7, 6, 5, 4, 4], 0.65);

Finally, to loop the animation:

		_animatedSprite.loopAnimation("idle_awake");
		
#Copyright
Images of the "Pop the Bear" character found in this project is copyrighted to AccidentalRebel Games.
