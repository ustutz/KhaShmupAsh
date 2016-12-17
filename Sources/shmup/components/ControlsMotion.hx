package shmup.components;
import kha.math.FastVector2;

/**
 * ...
 * @author Urs Stutz
 */
class ControlsMotion {
	
	public var velocity:FastVector2;

	public function new( velocityX:Float, velocityY:Float ) {
		velocity = new FastVector2( velocityX, velocityY );
	}
	
}