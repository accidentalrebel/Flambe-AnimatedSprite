package urgame;
import flambe.swf.Library;

class MoviePlayer extends flambe.swf.MoviePlayer
{
	var _sequenceArray:Array<String>;
	var _sequenceIndex:Int = 0;
	
	// ============================================= PUBLIC ============================================= //
	public function playSequence(sequenceArray : Array<String>, restart : Bool = true) : MoviePlayer
	{
		_sequenceArray = sequenceArray;
		play(_sequenceArray[_sequenceIndex]);
		
		return this;
	}
	
	// ============================================= MAIN ============================================= //
	public function new(lib : Library) 
	{
		super(lib);
	}
		
	override public function onUpdate(dt:Float) 
	{
		// If this update would end the oneshot movie, replace it with the looping movie
        if (_oneshotSprite != null && _oneshotSprite.position+dt > _oneshotSprite.symbol.duration) {
            _oneshotSprite = null;
            
			_sequenceIndex++;
			if ( _sequenceArray != null && _sequenceIndex < _sequenceArray.length )
				play(_sequenceArray[_sequenceIndex]);			
			else
				setCurrent(_loopingSprite);				
        }
	}
	
	// ============================================= DISPOSAL ============================================= //
	override public function dispose() 
	{
		super.dispose();		
		_sequenceArray = null;
	}
}