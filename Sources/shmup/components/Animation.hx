package shmup.components;
import kha.Image;

/**
 * ...
 * @author Urs Stutz
 */
class Animation {
	
	public var frameDuration:Float;
	public var frames:Array<Image>;
	
	public var currentTime:Float;
	public var index:Int;
	public var playState:PlayState;

	public function new( frameDuration:Float = 1, frames:Array<Image> = null ) {
		
		this.frameDuration = frameDuration;
		this.frames = ( frames == null ) ? new Array<Image>() : frames;
		
		currentTime = 0;
		index = 0;
		playState = PlayState.Once;
	}
	
}