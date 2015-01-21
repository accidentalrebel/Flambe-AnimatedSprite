package urgame;

import flambe.display.Font;
import flambe.display.Sprite;
import flambe.display.TextSprite;
import flambe.Entity;
import flambe.input.PointerEvent;
import flambe.math.Rectangle;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.display.FillSprite;
import flambe.display.ImageSprite;

class Main
{
	static private inline var MAX_NUM_OF_ANIMATIONS : Int = 4;
	static private var _currentIndex:Float = 0; 
	static private var _animatedSprite:AnimatedSprite;
	
    private static function main ()
    {
        // Wind up all platform-specific stuff
        System.init();

        // Load up the compiled pack in the assets directory named "bootstrap"
        var manifest = Manifest.fromAssets("bootstrap");
        var loader = System.loadAssetPack(manifest);
        loader.get(onSuccess);
    }

    private static function onSuccess (pack :AssetPack)
    {
        // Add a solid color background
        var background = new FillSprite(0xFFFFFF, System.stage.width, System.stage.height);
        System.root.addChild(new Entity().add(background));

		_currentIndex = 0;
		
		setupClickListeners();
		setupInstructionLabel(pack);
		setupAnimatedSprite(pack);		
    }
	
	// ============================================= SETUP ============================================= //
	static private function setupClickListeners() 
	{
		System.pointer.up.connect(onClickDetected, true);
	}
	
	static private function setupInstructionLabel(pack : AssetPack) 
	{
		var font : Font = new Font(pack, "arial");
		var instructionLabel : TextSprite = new TextSprite(font, "Click to change animation");
		instructionLabel.anchorX._ = instructionLabel.getNaturalWidth() / 2;
		instructionLabel.anchorY._ = instructionLabel.getNaturalHeight();
		instructionLabel.x._ = System.stage.width / 2;
		instructionLabel.y._ = System.stage.height / 2 + 100;
		
		System.root.addChild(new Entity().add(instructionLabel));
	}
	
	static private function setupAnimatedSprite(pack : AssetPack) 
	{
		_animatedSprite = new AnimatedSprite(pack, 
			[ "pop/idle_awake/1"
			, "pop/idle_awake/2"
			, "pop/idle_awake/3"
			, "pop/idle_awake/4"
			, "pop/thrown_awake/1"
			, "pop/thrown_awake/2"
			, "pop/thrown_awake/3"
			, "pop/thrown_awake/4"
			, "pop/thrown_awake/5"
			, "pop/idle_sleeping/1"
			, "pop/idle_sleeping/2"
			, "pop/idle_sleeping/3"
			, "pop/idle_sleeping/4"
			, "pop/thrown_sleeping/1"
			, "pop/thrown_sleeping/2"
			, "pop/thrown_sleeping/3"
			, "pop/thrown_sleeping/4"
			, "pop/thrown_sleeping/5"
			]
		);
		
		_animatedSprite.addAnimation("idle_awake", [0, 1, 2, 3, 2, 1, 0, 0], 0.65);
		_animatedSprite.addAnimation("thrown_awake", [4, 5, 6, 7, 8, 7, 6, 5], 0.65);
		_animatedSprite.addAnimation("idle_sleeping", [9, 10, 11, 12, 11, 10, 9, 9], 0.65);
		_animatedSprite.addAnimation("thrown_sleeping", [13, 14, 15, 16, 17, 16, 15, 14], 0.65);
		
		System.root.addChild(new Entity().add(_animatedSprite));
			
		_animatedSprite.loopAnimation("idle_awake");
		
		var spriteDimensions : Rectangle = Sprite.getBounds(_animatedSprite.owner);
		_animatedSprite.x._ = System.stage.width / 2 - spriteDimensions.width / 2;
		_animatedSprite.y._ = System.stage.height / 2 - spriteDimensions.height / 2;
	}
	
	// ============================================= EVENTS ============================================= //
	static private function onClickDetected(pointerEvent : PointerEvent) 
	{
		switchAnimation();
	}
	
	// ============================================= HELPERS ============================================= //
	static private function switchAnimation() 
	{
		_currentIndex++;
		if ( _currentIndex > _animatedSprite.getNumberOfAnimations() )
			_currentIndex = 1;
			
		switch(_currentIndex) {
			case 1: _animatedSprite.loopAnimation("thrown_awake");
			case 2: _animatedSprite.loopAnimation("idle_sleeping");
			case 3: _animatedSprite.loopAnimation("thrown_sleeping");
			case 4: _animatedSprite.loopAnimation("idle_awake");
		}
	}
}
